# RxD vs. an equivalent .mod-implementation
This segment demonstrates how to use .mod files for reaction scheme implementations instead relying on RxD's internal solver.

In this example, we implement the D1R cascade (Nair 2016) as a membrane mechanism, but keep dopamine and calcium as RxD variables. This way, we can use RxD for variables that needs transmembrane fluxes, axial diffusion, etc.

Dopamine is read-only in every variant, so it can never be in contention: it is declared `boundary_condition: true`, which makes Snudda instantiate it as an `rxd.Parameter` (a bath clamp), and the RxD reference does not deplete it either. Calcium is read-only in the two USEION variants, but the POINTER variant writes to it — see below.

The same cascade is provided in three `.mod` flavours:

| file                          | SUFFIX                     | SOLVE method | cal input      | writes cal back |
|-------------------------------|----------------------------|--------------|----------------|-----------------|
| `Nair_2016_optimized.mod`     | `Nair_2016_optimized`      | `euler`      | `USEION cali`  | no              |
| `Nair_2016_optimized_di.mod`  | `Nair_2016_optimized_di`   | `derivimplicit` | `USEION cali` | no             |
| `Nair_2016_optimized_ptr.mod` | `Nair_2016_optimized_ptr`  | `euler`      | `POINTER ca_ref` | yes           |

`euler` is faster but less exact; `derivimplicit` does a Newton step per `dt` and is the most accurate first-order option NEURON offers for stiff systems. Running both lets us separate solver error from any other source of divergence vs. the RxD reference (e.g. ordering of `assign_calculated_values()` relative to `SOLVE`, RxD's spatial discretization, etc.).

### The POINTER variant and calcium mass balance

The two USEION variants read `cali` but never consume it, whereas in the RxD reference the cascade genuinely buffers calcium — 15 reactions (`ReactionFlux{5,16,24,25,26,28,54,73,74,75,76,115,116,123,124}`) take `cal` as a reactant. The mod branches use `reaction_diffusion_DA_only.json`, which declares no reactions at all, so that sink is simply absent. At small distal volumes this is the dominant source of divergence from the reference.

`Nair_2016_optimized_ptr.mod` restores it. It reads `cal` through a `POINTER` aimed straight at the RxD node's `_ref_concentration`, and each step writes the net cascade consumption back through the same pointer (`ca_ref = ca_ref + ca_rate * dt`, with `ca_rate` summing exactly those 15 flux terms).

This is a write, but not a contended one. `caldyn_ms` runs with `use_rxd_caldyn_ms = 1.0` in both branches (set via `modulation_key = "abc"`), so it emits `ical` rather than integrating `cali` itself, and RxD owns the `cal` state. The two contributors are therefore disjoint physical terms — RxD applies transmembrane flux, the mechanism applies cascade buffering — rather than two writers fighting over one quantity.

The real cost is operator splitting: the mechanism's write and RxD's own advance happen sequentially within a timestep instead of being solved together, which is first-order in `dt` and sensitive to their ordering. `plot_error_distal.py` quantifies what that costs.

Dopamine is deliberately *not* written back. Since it is bath-clamped in both branches, adding a `da_ref` write would introduce a sink the reference does not have, and — because an `rxd.Parameter` node is never restored by a solver — the error would compound every step. If DA is ever unclamped (`boundary_condition: false`), the correct term is `da_rate = -(R2 + R3)`; `R1` and `R68` mention DA but keep it bound.

## Running the example
The `.mod` file is generated from the SBtab spec in `sbtab_source/`
>>> SbTAB conversion goes here <<< (+ description if manual edits are needed)

```bash
python setup_networks.py                                # builds networks/{rxd,mod,mod_di,mod_ptr}

# For demo purposes, we create a new folder of mechanisms that includes the new .mod.
mkdir -p mechanisms
cp ../../snudda_data/neurons/mechanisms/*.mod mechanisms/
cp *.mod                                    mechanisms/
nrnivmodl mechanisms/

# Run RxD reference
snudda simulate networks/rxd    --simulation_config sim_rxd.json \
    --mechdir mechanisms --enable_rxd_neuromodulation

# Run .mod with euler
snudda simulate networks/mod    --simulation_config sim_mod.json \
    --mechdir mechanisms --enable_rxd_neuromodulation

# Run .mod with derivimplicit
snudda simulate networks/mod_di --simulation_config sim_mod_di.json \
    --mechdir mechanisms --enable_rxd_neuromodulation

# Run the POINTER variant. `snudda simulate` cannot wire POINTERs, so this one
# goes through a driver script that calls h.setpointer between setup() and run().
python run_mod_ptr.py

# todo: this 
python plot_compare.py                                  # → compare_rxd_vs_mod.{png,html}
python plot_compare_distal.py                           # → compare_rxd_vs_mod_distal.{png,html}
python plot_error_distal.py                             # → error_rxd_vs_mod_distal.{png,html}
```

## Wall-clock cost

Single dSPN, no synapses, 1 s simulated, on an Apple Silicon laptop:

| `sim_dt` | RxD branch | .mod branch | speedup |
|---------:|-----------:|------------:|--------:|
| 50 µs    | ~16 min    | ~8 s        | ~120×   |
| 25 µs    | ~33 min    | ~15 s       | ~130×   |

Wall-clock per run is auto-logged to
`networks/{rxd,mod}/benchmark_log.json` (one `[seconds, n_workers]`
entry per `snudda simulate` invocation, cumulative — clear the file
before a fresh measurement).
