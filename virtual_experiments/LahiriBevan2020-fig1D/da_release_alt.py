import numpy as np

def dopamine_release_alt(t, A, B, tau_rise, tau_decay1, tau_decay2, t0):

    A *= 1e-9
    
    # Create heaviside step function
    heaviside = np.where(t >= t0, 1, 0)
    
    # Double exponential model
    print(f"{A =:f}, {t0 =:f}, {tau_rise =:f}, {B =:f}, {tau_decay1 =:f}, {tau_decay2=:f}")
    concentration = A * (B*np.exp(-(t-t0)/tau_decay1) + (1-B)*np.exp(-(t-t0)/tau_decay2) - np.exp(-(t-t0)/tau_rise)) * heaviside
    
    return concentration * 1e9
