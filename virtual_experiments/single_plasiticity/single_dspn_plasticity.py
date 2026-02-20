import os
from snudda import Snudda

neuron = "dspn"

neuron_path = os.path.join("..", "..", "snudda_data", "neurons", "striatum", neuron)
network_path = os.path.join("networks", "single_dspn")


snudda = Snudda(network_path=network_path)
si = snudda.init_tiny(neuron_paths=neuron_path, neuron_names=neuron, number_of_neurons=[5], 
                      random_seed=1234)

si.network_data["regions"]["Cube"]["neurons"]["dspn"]["reaction_diffusion"] = "../../data/JSON/reaction_diffusion_D1_from_SBTab_cal.json"

si.network_data["regions"]["Cube"]["neurons"][neuron]["modulation"] = "../../data/JSON/modulation_parameters-v2.json"
si.network_data["regions"]["Cube"]["neurons"][neuron]["modulation_key"] = "abc"

si.write_json()

snudda.create_network(input_config="input.json")

# Free memory
snudda = None

mech_dir = "../../snudda_data/neurons/mechanisms"
sample_dt = None # 0.00005

sim_config = "short_sim.json"

sim_output = os.path.join(network_path, "simulation", "output.hdf5")


sim_time = 2.2
n_workers = 5


os.system("nrnivmodl ../../snudda_data/neurons/mechanisms/")

run_str = f"mpirun -n {n_workers} snudda simulate {network_path} --time {sim_time} --simulation_config {sim_config} --mechdir {mech_dir} --enable_rxd_neuromodulation"
print(run_str)
