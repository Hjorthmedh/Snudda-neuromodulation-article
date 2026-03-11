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
plot_syn_plast.py
```


