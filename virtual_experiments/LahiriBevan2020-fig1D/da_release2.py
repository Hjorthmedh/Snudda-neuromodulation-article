import numpy as np

def dopamine_release2(t, A, tau_rise, tau_decay,
                      B, tau_rise2, tau_decay2,
                      t0):
    """
    Double exponential model for synaptic dopamine release
    
    Parameters:
    t: time array (s) 
    A: scaling factor (concentration units)
    tau_rise: rise time constant (s) - fast component
    tau_decay: decay time constant (s) - slow component
    t0: stimulation onset time (s)
    """
    
    # Double exponential model
    concentration = A * (np.exp(-(t-t0)/tau_decay) - np.exp(-(t-t0)/tau_rise)) \
        + B * (np.exp(-(t-t0)/tau_decay2) - np.exp(-(t-t0)/tau_rise2))

    concentration[np.where(t < t0)] = 0
    
    return concentration
