# Relicating Figure 3 in Santos et al, 2021

We create a network with N unconnnected dSPN. Each dSPN receives a
burst of synaptic input for 1 second.

In addition the neurons receive dopamine input at different times in
relationship to the synaptic input.


Generate the plots using:

```
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 0 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 1 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 2 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 3 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 4 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 5 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 6 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 7 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 8 --compartment_id 10
snudda_plot_rxd networks/santos_fig3/ networks/santos_fig3/simulation/output.hdf5 --neuron_id 9 --compartment_id 10
```


```
plot_summary3.py
```

Where you vary neuron_id 0 to 8, to see different timelags between DA and synaptic input: -4, -3, -2, -1, -0, 1, 2, 3, 4
neuron_id 9 is without DA application.

