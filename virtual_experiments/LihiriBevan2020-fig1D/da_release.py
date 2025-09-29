import numpy as np

def dopamine_release(t, A, tau_rise, tau_decay, t0):
    """
    Double exponential model for synaptic dopamine release
    
    Parameters:
    t: time array (s) 
    A: scaling factor (concentration units)
    tau_rise: release time constant (s) - fast component
    tau_decay: uptake time constant (s) - slow component
    t0: stimulation onset time (s)
    """
    # Create heaviside step function
    heaviside = np.where(t >= t0, 1, 0)
    
    # Double exponential model
    concentration = A * (np.exp(-(t-t0)/tau_decay) - np.exp(-(t-t0)/tau_rise)) * heaviside
    
    return concentration
