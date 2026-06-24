# RxD vs. an equivalent .mod-implementation
This segment demonstrates how to use .mod files for reaction scheme implementations instead relying on RxD's internal solver.

In this example, we implement the D1R cascade as a membrane mechanism, but keep dopamine and calcium as RxD variables. (Dopamine and calcium are read only in the membrane mechanism, so there is no risk of write conflicts.)

For the .mod file, we use the faster but less exact solver EULER. This converges within floating point error to the RxD reference despite being less exact with an overall speedup around ~100x. (The timesteps used for neuron simulations are much smaller than the event scale of the biochemstry.)

## Running the example
The .mod file is obtained using /.../ >>> SbTAB conversion thing <<<

To generate the figures, /.../

```
bla bla
```
