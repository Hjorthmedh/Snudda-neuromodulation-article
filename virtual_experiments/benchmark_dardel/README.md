# Benchmark MOD version of biochemical reaction

We run 128 neurons on 128 cores, then repeat the simulation on 64,32,16,8,4,2 and 1 core.


The config files was generated using
```
python make_multiple_simulation_config_files.py simulation_config.json
```

The simulation is run by:

```
sbatch Dardel_simulate_network_dspn_only_MOD.job
```

We then need to check the log files for the run time.

