# RxD vs. an equivalent .mod-implementation
This segment demonstrates how to use .mod files for reaction scheme implementations instead relying on RxD's internal solver.

In this example, we implement the D1R cascade (Nair 2016) as a membrane mechanism, but keep dopamine and calcium as RxD variables. (Dopamine and calcium are read only in the membrane mechanism, so there is no risk of write conflicts.) This way, we can use RxD for variables that needs transmembrane fluxes, axial diffusion, etc.

The same cascade is provided in two `.mod` flavours that differ only in their integrator:

| file                          | SUFFIX                     | SOLVE method     |
|-------------------------------|----------------------------|------------------|
| `Nair_2016_optimized.mod`     | `Nair_2016_optimized`      | `euler`          |
| `Nair_2016_optimized_di.mod`  | `Nair_2016_optimized_di`   | `derivimplicit`  |

`euler` is faster but less exact; `derivimplicit` does a Newton step per `dt` and is the most accurate first-order option NEURON offers for stiff systems. Running both lets us separate solver error from any other source of divergence vs. the RxD reference (e.g. ordering of `assign_calculated_values()` relative to `SOLVE`, RxD's spatial discretization, etc.).

## Running the example
The `.mod` file is generated from the SBtab spec in `sbtab_source/`
>>> SbTAB conversion goes here <<< (+ description if manual edits are needed)

```bash
python setup_networks.py                                # builds networks/{rxd,mod,mod_di}

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

python plot_compare.py                                  # → compare_rxd_vs_mod.{png,html}
python plot_compare_distal.py                           # → compare_rxd_vs_mod_distal.{png,html}
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
