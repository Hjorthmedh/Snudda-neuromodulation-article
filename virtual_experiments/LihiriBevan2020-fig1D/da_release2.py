import numpy as np

def dopamine_release2(t, A, tau_release, tau_uptake,
                      B, tau_release2, tau_uptake2,
                      t0):
    """
    Double exponential model for synaptic dopamine release
    
    Parameters:
    t: time array (s) 
    A: scaling factor (concentration units)
    tau_release: release time constant (s) - fast component
    tau_uptake: uptake time constant (s) - slow component
    t0: stimulation onset time (s)
    """
    # Create heaviside step function
    heaviside = np.where(t >= t0, 1, 0)
    
    # Double exponential model
    concentration = A * (np.exp(-(t-t0)/tau_uptake) - np.exp(-(t-t0)/tau_release)) * heaviside \
        + B * (np.exp(-(t-t0)/tau_uptake2) - np.exp(-(t-t0)/tau_release2)) * heaviside \
    
    return concentration
