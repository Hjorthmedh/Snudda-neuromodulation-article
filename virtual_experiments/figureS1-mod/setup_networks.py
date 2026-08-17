"""Build four single-dSPN networks for figure S1.

  networks/rxd     — full RxD cascade computes PKAc from bath DA
  networks/mod     — DA+cal RxD bath; Nair_2016_optimized.mod (METHOD euler)
  networks/mod_di  — DA+cal RxD bath; Nair_2016_optimized_di.mod (derivimplicit)
  networks/mod_ptr — DA+cal RxD bath; Nair_2016_optimized_ptr.mod (METHOD euler
                     + POINTER-based read of the RxD nodes, writing the cascade's
                     Ca consumption back so it feeds into the mass balance. DA is
                     read-only: it is bath-clamped, so the RxD reference does not
                     deplete it either.)

mod_ptr cannot be run via `snudda simulate` (the CLI does not wire POINTERs);
use run_mod_ptr.py instead.
"""
import os
from snudda import Snudda

SNUDDA_DATA = os.path.join("..", "..", "snudda_data")
NEURON_PATH = os.path.join(SNUDDA_DATA, "neurons", "striatum", "dspn")
RXD_CASCADE = "../../data/JSON/reaction_diffusion_D1_from_SBTab_cal.json"
RXD_DA_ONLY = "reaction_diffusion_DA_only.json"
MOD_PARAMS_RXD = "../../data/JSON/modulation_parameters-v2.json"
MOD_PARAMS_MOD = "modulation_parameters_mod.json"


def build(network_dir, modulation_json, rxd_config, extra_mechanisms=None):
    s = Snudda(network_path=network_dir)
    si = s.init_tiny(neuron_paths=NEURON_PATH, neuron_names="dspn",
                     number_of_neurons=[1], random_seed=1234,
                     snudda_data=SNUDDA_DATA)
    n = si.network_data["regions"]["Cube"]["neurons"]["dspn"]
    if rxd_config:
        n["reaction_diffusion"] = rxd_config
    n["modulation"] = modulation_json
    n["modulation_key"] = "abc"
    if extra_mechanisms:
        n["extra_mechanisms"] = extra_mechanisms
    si.write_json()
    s.create_network()


if __name__ == "__main__":
    NAIR     = {"soma": ["Nair_2016_optimized"],     "basal": ["Nair_2016_optimized"]}
    NAIR_DI  = {"soma": ["Nair_2016_optimized_di"],  "basal": ["Nair_2016_optimized_di"]}
    NAIR_PTR = {"soma": ["Nair_2016_optimized_ptr"], "basal": ["Nair_2016_optimized_ptr"]}
    build("networks/rxd",     MOD_PARAMS_RXD, rxd_config=RXD_CASCADE, extra_mechanisms=None)
    build("networks/mod",     MOD_PARAMS_MOD, rxd_config=RXD_DA_ONLY, extra_mechanisms=NAIR)
    build("networks/mod_di",  MOD_PARAMS_MOD, rxd_config=RXD_DA_ONLY, extra_mechanisms=NAIR_DI)
    build("networks/mod_ptr", MOD_PARAMS_MOD, rxd_config=RXD_DA_ONLY, extra_mechanisms=NAIR_PTR)

    mech_dir = "mechanisms"
    print()
    print(f"# Prep mechanisms (copies snudda_data mech + local overrides)")
    print(f"mkdir -p {mech_dir}")
    print(f"cp ../../snudda_data/neurons/mechanisms/*.mod {mech_dir}/")
    print(f"cp *.mod {mech_dir}/")
    print(f"nrnivmodl {mech_dir}/")
    print()
    print(f"# Run")
    print(f"snudda simulate networks/rxd     --simulation_config sim_rxd.json "
          f"--mechdir {mech_dir} --enable_rxd_neuromodulation")
    print(f"snudda simulate networks/mod     --simulation_config sim_mod.json "
          f"--mechdir {mech_dir} --enable_rxd_neuromodulation")
    print(f"snudda simulate networks/mod_di  --simulation_config sim_mod_di.json "
          f"--mechdir {mech_dir} --enable_rxd_neuromodulation")
    print(f"# mod_ptr uses POINTERs so it can't run through the snudda CLI directly:")
    print(f"python run_mod_ptr.py")
