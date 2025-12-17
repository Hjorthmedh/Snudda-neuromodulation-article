import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import pandas as pd

from da_release2 import dopamine_release2

df = pd.read_csv("LahiriBevan-Fig1D-20Hz.csv")
df.columns = df.columns.str.strip()
t_data = df["t"].values
C_data = df["C"].values
C_data = np.maximum(0, C_data)  # Can't have negative concentrations


initial_guess = [600e-9, 0.02, 2.0, 200e-9, 0.03, 10.0, 5.2]
bounds = ([0, 0.001, 0.1, 0, 0.001, 0.1, 4.0],      # lower bounds
          [2000, 0.5, 10.0, 2000, 0.5, 50.0, 6.0]) 


popt, pcov = curve_fit(dopamine_release2, t_data, C_data, 
                       p0=initial_guess, bounds=bounds, maxfev=5000)

A_fit, tau_rise_fit, tau_decay_fit, B_fit, tau_rise2_fit, tau_decay2_fit, t0_fit = popt
param_errors = np.sqrt(np.diag(pcov))
    
# Generate fitted curve for plotting
t_fit = np.linspace(min(t_data), max(t_data), 1000)
C_fit = dopamine_release2(t_fit, *popt)

C_pred = dopamine_release2(t_data, *popt)
ss_res = np.sum((C_data - C_pred) ** 2)
ss_tot = np.sum((C_data - np.mean(C_data)) ** 2)
r_squared = 1 - (ss_res / ss_tot)


plt.figure(figsize=(12, 8))
    
# Plot data and fit
plt.plot(t_data, C_data*1e6, 'ko', markersize=3, alpha=0.7, label='Digitized Data')
plt.plot(t_fit, C_fit*1e6, 'r-', linewidth=2, label='Fitted Model')
plt.axvline(x=t0_fit, color='blue', linestyle='--', alpha=0.7, 
            label=f'Stimulation onset (t₀ = {t0_fit:.2f} s)')
    
# Formatting
plt.xlabel('Time (s)')
plt.ylabel('Dopamine Concentration (nM)')
plt.title('Dopamine Release: Data Fit to Two Double Exponential Model')
plt.grid(True, alpha=0.3)
plt.legend()

param_text = (f'Fitted Parameters:\n'
              f'A = {A_fit:.3g} ± {param_errors[0]:.3g} mM\n'
              f'τ_rise = {tau_rise_fit:.4f} ± {param_errors[1]:.4f} s\n'
              f'τ_decay = {tau_decay_fit:.2f} ± {param_errors[2]:.2f} s\n'
              f'B = {B_fit:.3g} ± {param_errors[3]:.3g} mM\n'
              f'τ_rise = {tau_rise2_fit:.1f} ± {param_errors[4]:.1f} s\n'
              f'τ_decay = {tau_decay2_fit:.2f} ± {param_errors[5]:.2f} s\n'
              f't₀ = {t0_fit:.2f} ± {param_errors[6]:.2f} s\n'
              f'R² = {r_squared:.4f}')

plt.text(0.02, 0.98, param_text, transform=plt.gca().transAxes,
             verticalalignment='top', bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.9))
    
plt.tight_layout()

plt.ion()
plt.show()

plt.savefig("DA_activation_fit2.png")





