#!/usr/bin/env python3

import os
import numpy as np
import json
import timeit


from snudda.place.create_cube_mesh import create_cube_mesh
from snudda import Snudda
from snudda.utils import SnuddaLoad



snudda_data = os.path.realpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "snudda_data"))
network_base_path = os.path.realpath("networks")

random_seed = 1234

n_dspn = 3

neuron_path_list = [os.path.join(snudda_data, "neurons", "striatum", "dspn")]
connectivity_info = os.path.join(snudda_data, "connectivity", "striatum", "striatum-connectivity.json")

benchmark_size = [2, 4, 8, 16, 32, 64, 128]

run_time = {}

for bs in benchmark_size:
    run_time[bs] = {}
    
    network_path = os.path.join(network_base_path, f"benchmark_rxd_{bs}")
    print(f"Processing {network_path}")
    os.makedirs(network_path, exist_ok=True)

    snd = Snudda(network_path=network_path)
    snd_init = snd.init_tiny(neuron_paths=neuron_path_list,
                             neuron_names=["dSPN"],
                             number_of_neurons=[n_dspn],
                             connection_config=connectivity_info,
                             density=80500*0.5,
                             d_min=15e-6,
                             snudda_data=snudda_data,
                             random_seed=random_seed)

    snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["reaction_diffusion"] = f"rxd_models/reactions_{bs}.json"
    # snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["modulation"] = "data/modulation_parameters.json"
    # snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["modulation_key"] = "abc"

    gaba_param_post_dspn = {"mod_pka_g_min": 1.2,
                            "mod_pka_g_max": 0.8,
                            "mod_pka_g_half": 3.6e-6,
                            "mod_pka_g_slope": 3
                            }

    snd_init.network_data["regions"]["Cube"]["connectivity"]["dSPN,dSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_dspn)
        
    snd_init.write_json()

    snd.create_network(input_config="../network_example/data/dopamine_experiment_input.json")

    # snd.simulate(use_rxd_neuromodulation=True, time=0.1, snudda_data=snudda_data)

    run_time[bs]["start_time"] = timeit.default_timer() 
    os.system(f"snudda simulate {network_path} --time 0.1 --enable_rxd_neuromodulation")
    run_time[bs]["end_time"] = timeit.default_timer()
    run_time[bs]["duration"] = run_time[bs]["end_time"] - run_time[bs]["start_time"]
    run_time[bs]["num_species"] = bs


with open("run_time.json", "w") as f:
    json.dump(run_time, f, indent=4)    

# Plot the disaster

