In ```virtual_experiments/benchmark_dardel_RxD``` folder on Dardel run:

```
sbatch Dardel_simulate_network_dspn_only_RxD.job
```

From the log files, I have manually extracted the run time:

```
hjorth@login1:~/_Snudda-neuromodulation-article/virtual_experiments/benchmark_dardel_RxD/networks/striatum_with_dopamine_dspn_RxD/log> tail -n 6 DA_sim_RxD-128.txt-0
 99% done. Elapsed: 19679.7 s, estimated time left: 198.8 s
100% done. Elapsed: 19878.6 s, estimated time left: 0.0 s
Simulation done.
Simulation run time: 19892.0 s
Simulation done, saving output
Program run time: 19927
```

and in the case of partial runs, summed the elapsed duration and the estimated duration left:

```
hjorth@login1:~/_Snudda-neuromodulation-article/virtual_experiments/benchmark_dardel_RxD/networks/striatum_with_dopamine_dspn_RxD/log> tail -n 6 DA_sim_RxD-4.txt-0
  1% done. Elapsed: 7179.2 s, estimated time left: 710744.9 s
  2% done. Elapsed: 14369.1 s, estimated time left: 704084.2 s
  3% done. Elapsed: 21546.9 s, estimated time left: 696681.8 s
  4% done. Elapsed: 28724.0 s, estimated time left: 689375.6 s
  5% done. Elapsed: 35906.8 s, estimated time left: 682228.9 s
 10% done. Elapsed: 71840.0 s, estimated time left: 646559.8 s

```

The results are stored in:

```benchmark_dardel_rxd_runtime.csv```


For the MOD version of the code. On dardel, go to the ```virtual_experiments/benchmark_dardel_MOD``` folder.

```
sbatch Dardel_simulate_network_dspn_only_MOD.job
```

The extract the run times from:

```
hjorth@login1:~/_Snudda-neuromodulation-article/virtual_experiments/benchmark_dardel_MOD/networks/striatum_with_dopamine_dspn_MOD/log> tail -n 6 DA_sim-128.txt-0
 99% done. Elapsed: 261.5 s, estimated time left: 2.6 s
100% done. Elapsed: 264.2 s, estimated time left: 0.0 s
Simulation done.
Simulation run time: 264.3 s
Simulation done, saving output
Program run time: 268
```

which is already done in ```benchmark_dardel_MOD_runtime.csv```.


Finally, to generate the figures:

```
python plot_benchmark_MOD_RxD.py
```

creates ```rxd_mod_runtime_scaling.png``` and ```rxd_mod_runtime_scaling.pdf```.