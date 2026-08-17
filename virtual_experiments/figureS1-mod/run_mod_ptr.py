"""Run the mod_ptr network with a setpointer pass between sim.setup() and sim.run().

The Nair_2016_optimized_ptr.mod cascade reads/writes Ca and DA via POINTERs
(ca_ref, da_ref) rather than USEION. Snudda's CLI doesn't know to wire those,
so this script replicates `snudda simulate` programmatically and inserts the
setpointer step at the right moment.

Usage:
    python run_mod_ptr.py
"""
import os
import sys
from neuron import h

# Force CLI-equivalent flags
NETWORK_PATH      = "networks/mod_ptr"
SIM_CONFIG        = "sim_mod_ptr.json"
MECH_DIR          = "mechanisms"
NETWORK_FILE      = f"{NETWORK_PATH}/network-synapses.hdf5"
OUTPUT_FILE       = f"{NETWORK_PATH}/simulation/output.hdf5"
LOG_FILE          = f"{NETWORK_PATH}/log/network-simulation-log.txt"
SUFFIX            = "Nair_2016_optimized_ptr"


def wire_pointers(sim):
    """For every segment that has the cascade ptr-mech inserted, point ca_ref
    and da_ref at the corresponding RxD cal/DA node's _ref_concentration.
    """
    n_set = 0
    for nid, n in sim.neurons.items():
        if n.modulation is None:
            print(f"[wire_pointers] neuron {nid}: no modulation, skipping")
            continue
        if n.modulation.node_cache is None:
            n.modulation.build_node_cache()
        # Region lookup: walk soma vs basal vs axon and pick the matching region
        soma_secs  = set(n.icell.soma)
        axon_secs  = set(n.icell.axon) if hasattr(n.icell, "axon") else set()
        for sec in n.icell.all:
            if sec in soma_secs:
                region_name = "soma_internal"
            elif sec in axon_secs:
                region_name = "axon_internal"
            else:
                region_name = "dend_internal"
            for seg in sec:
                mech = getattr(seg, SUFFIX, None)
                if mech is None:
                    continue
                try:
                    ca_node = n.modulation.get_node_from_cache("cal", seg, region_name)
                    da_node = n.modulation.get_node_from_cache("DA",  seg, region_name)
                except KeyError as e:
                    print(f"[wire_pointers] no RxD node for {seg}: {e}")
                    continue
                h.setpointer(ca_node._ref_concentration, "ca_ref", mech)
                h.setpointer(da_node._ref_concentration, "da_ref", mech)
                n_set += 1
    print(f"[wire_pointers] setpointer ca_ref/da_ref on {n_set} segments")


def main():
    # NEURON auto-loads compiled mechs when `from neuron import h` runs from a
    # cwd containing arm64/ (or x86_64/, etc.). Just sanity-check that one
    # exists; don't call nrn_load_dll ourselves or we get duplicate registrations.
    if not any(os.path.isdir(d) for d in ("arm64", "aarch64", "x86_64")) \
            and not os.path.exists("nrnmech.dll"):
        sys.exit(f"No compiled mechanisms found. Run: nrnivmodl {MECH_DIR}/")

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    os.makedirs(os.path.dirname(LOG_FILE),    exist_ok=True)

    from snudda.simulate.simulate import SnuddaSimulate

    sim = SnuddaSimulate(network_file=NETWORK_FILE,
                         output_file=OUTPUT_FILE,
                         log_file=LOG_FILE,
                         simulation_config=SIM_CONFIG,
                         use_rxd_neuromodulation=True,
                         verbose=False)
    sim.setup()

    # setup() calls setup_parse_sim_info() which picks up record_all_soma from
    # sim_mod_ptr.json, so soma voltage recording is already wired.

    # Critical step: wire the POINTERs *after* mechs are inserted and RxD species exist.
    wire_pointers(sim)

    # Run + write
    t_sim_ms = sim.sim_info.get("time", 1.0) * 1000.0
    print(f"[run_mod_ptr] Running {t_sim_ms} ms.")
    sim.run(t_sim_ms)
    sim.write_output()
    sim.clear_neuron()
    print(f"[run_mod_ptr] Done. Output in {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
