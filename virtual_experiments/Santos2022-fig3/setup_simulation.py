import os
from snudda import Snudda

# Headsup, if you want connectivity, then the dspn must be named "dSPN", otherwise it does not match connectivity.

neuron_path = os.path.join("..", "..", "snudda_data", "neurons", "striatum", "dspn")
network_path = os.path.join("networks", "santos_fig3")

snudda = Snudda(network_path=network_path)
si = snudda.init_tiny(neuron_paths=neuron_path, neuron_names="dspn", number_of_neurons=[10], 
                      random_seed=1234)

si.network_data["regions"]["Cube"]["neurons"]["dspn"]["reaction_diffusion"] = "../../data/JSON/reaction_diffusion_D1_from_SBTab_cal.json"

si.network_data["regions"]["Cube"]["neurons"]["dspn"]["modulation"] = "../../data/JSON/modulation_parameters-v2.json"
si.network_data["regions"]["Cube"]["neurons"]["dspn"]["modulation_key"] = "abc"
si.network_data["regions"]["Cube"]["neurons"]["dspn"]["parameter_key"] = "p06ae8d19"
si.network_data["regions"]["Cube"]["neurons"]["dspn"]["morphology_key"] = "m4a48752c"

neuron_path_dict = {}
for n in range(0, 10):
    neuron_path_dict[f"dspn_{n}"] = "../../snudda_data/neurons/striatum/dspn/str-dspn-e150602_c1_D1-mWT-0728MSN01-v20220620/"

si.network_data["regions"]["Cube"]["neurons"]["dspn"]["neuron_path"] = neuron_path_dict


si.write_json()

snudda.create_network(input_config="input.json", use_meta_input=False)

# Free memory
snudda = None

mech_dir = "../../snudda_data/neurons/mechanisms"
sample_dt = None # 0.00005

sim_config = "simulation_config_fig3.json"

sim_output = os.path.join(network_path, "simulation", "output.hdf5")


sim_time = 30
n_workers = 5


os.system("nrnivmodl ../../snudda_data/neurons/mechanisms/")

run_str = f"mpirun -n {n_workers} snudda simulate {network_path} --time {sim_time} --simulation_config {sim_config} --mechdir {mech_dir} --enable_rxd_neuromodulation"
print(run_str)

print("snudda_plot_rxd  networks/single_dspn/ networks/single_dspn/simulation/output.hdf5 --neuron_id 0")
print("snudda_plot_rxd  networks/single_dspn/ networks/single_dspn/simulation/output.hdf5 --neuron_id 1")
