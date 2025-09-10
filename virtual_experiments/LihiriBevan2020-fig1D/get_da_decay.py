import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import pandas as pd

from da_release import dopamine_release

df = pd.read_csv("LihiriBevan-Fig1D.csv")
df.columns = df.columns.str.strip()
t_data = df["t"].values
C_data = df["C"].values


initial_guess = [600, 0.02, 2.0, 5.2]
bounds = ([0, 0.001, 0.1, 4.0],      # lower bounds
          [2000, 0.5, 10.0, 6.0]) 


popt, pcov = curve_fit(dopamine_release, t_data, C_data, 
                       p0=initial_guess, bounds=bounds, maxfev=5000)

A_fit, tau_release_fit, tau_uptake_fit, t0_fit = popt

# Generate fitted curve for plotting
t_fit = np.linspace(min(t_data), max(t_data), 1000)
C_fit = dopamine_release(t_fit, *popt)

plt.figure(figsize=(12, 8))
    
# Plot data and fit
plt.plot(t_data, C_data, 'ko', markersize=3, alpha=0.7, label='Digitized Data')
plt.plot(t_fit, C_fit, 'r-', linewidth=2, label='Fitted Model')
plt.axvline(x=t0_fit, color='blue', linestyle='--', alpha=0.7, 
            label=f'Stimulation onset (t₀ = {t0_fit:.2f} s)')
    
# Formatting
plt.xlabel('Time (s)')
plt.ylabel('Dopamine Concentration (nM)')
plt.title('Dopamine Release: Data Fit to Double Exponential Model')
plt.grid(True, alpha=0.3)
plt.legend()
plt.show()



import pdb
pdb.set_trace()



