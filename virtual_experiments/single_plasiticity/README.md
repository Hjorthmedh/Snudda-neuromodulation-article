TODO: Replicate figure 2 in Santos paper

# Plasticity example

We setup two dspn neurons with RxD implemented dopamine D1 cascade. Here both DA and Calcium (cal) are coupled between RxD biochemistry and NEURON electrophysiology. Furthermore the PKAc level and substrate level affect the ion channels, and glutamate channel parameters (conductance, half activation etc).

Stimulation procotol:

1.
Presynaptic activiation alone
tex. 30 sekunders simulering, 10Hz presynapisk aktivering

2.
Presynaptic activation in presence of dopamine (at different levels)

3.
Presynaptic activation paired with postsynaptic activation

4.
Presynaptic activation paired + dopamine, paired with postsynaptic activation

5.
Dopamine alone





## Code to run:

First setup network:

```
python single_dspn_plasticity.py
```

Run the simulation using the printed mpirun command (displayed by python script).

Plot traces using:

```
snudda_plot_rxd networks/single_dspn networks/single_dspn/simulation/output.hdf5 --neuron_id 0 --compartment_id 5
snudda_plot_rxd networks/single_dspn networks/single_dspn/simulation/output.hdf5 --neuron_id 1 --compartment_id 5

# python plot_cal_alt4.py networks/single_dspn/simulation/output.hdf5 0
```



If you want to change the parameters, then you can use ```enrich_synapse_parameters.py``` then run the ```single_dspn_plasticity.py``` and the rest as before.

Additional note, if you want to run the steady state run with larger timestep, then replace simulation config with ```short_sim2-check-steady-state.json```, ie run:

mpirun -n 2 snudda simulate networks/single_dspn --time 100 --simulation_config short_sim2-check-steady-state.json --mechdir ../../snudda_data/neurons/mechanisms --enable_rxd_neuromodulation

This takes around 1200 seconds on a M1 Mac laptop.