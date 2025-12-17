import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import pandas as pd

from da_release_alt import dopamine_release_alt

df = pd.read_csv("LahiriBevan-Fig1D.csv")
df.columns = df.columns.str.strip()
t_data = df["t"].values
C_data = df["C"].values


# initial_guess = [600e-9, 0.1, 0.2, 20.0, 1, 5.2]
initial_guess =  [600, 0.1, 0.01, 20.0, 2, 5.2]

# bounds = ([0, 0, 0.001, 0.001, 0.001, 4.0],      # lower bounds
#           [2000e-9, 1, 100, 100.0, 100, 6.0]) 
bounds = ([0, 0, 0.001, 0.001, 0.001, 4.0],      # lower bounds
          [2000, 1, 100, 100.0, 100, 6.0]) 


popt, pcov = curve_fit(dopamine_release_alt, t_data, C_data*1e9, 
                       p0=initial_guess, bounds=bounds, maxfev=5000)

A_fit, B_fit, tau_rise_fit, tau_decay1_fit, tau_decay2_fit, t0_fit = popt
param_errors = np.sqrt(np.diag(pcov))
    
# Generate fitted curve for plotting
t_fit = np.linspace(min(t_data), max(t_data), 1000)
C_fit = dopamine_release_alt(t_fit, *popt)

C_pred = dopamine_release_alt(t_data, *popt)
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
              f'A = {A_fit*1e6:.1f} ± {param_errors[0]*1e6:.1f} nM\n'
              f'B = {B_fit:.1f} ± {param_errors[1]:.1f}\n'              
              f'τ_rise = {tau_rise_fit*1e3:.2f} ± {param_errors[2]*1e3:.2f} ms\n'
              f'τ_decay1 = {tau_decay1_fit:.1f} ± {param_errors[3]:.1f} s\n'
              f'τ_decay2 = {tau_decay2_fit:.1f} ± {param_errors[4]:.1f} s\n'
              f't₀ = {t0_fit:.2f} ± {param_errors[5]:.2f} s\n'
              f'R² = {r_squared:.4f}')

plt.text(0.02, 0.98, param_text, transform=plt.gca().transAxes,
             verticalalignment='top', bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.9))
    
plt.tight_layout()

plt.ion()
plt.show()

plt.savefig("DA_activation_fit3.png")




