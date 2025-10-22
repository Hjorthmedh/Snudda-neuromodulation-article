#!/usr/bin/env python3

# This creates an example network

import os
import numpy as np

from snudda.place.create_cube_mesh import create_cube_mesh
from snudda import Snudda
from snudda.utils.ablate_network import SnuddaAblateNetwork
from snudda.utils import SnuddaLoad

ipython_profile = os.getenv("IPYTHON_PROFILE", "default")
ipython_dir = os.getenv("IPYTHONDIR")

parallel_flag = ipython_dir is not None
print(f"{parallel_flag = }\n{ipython_dir = }\n{ipython_profile = }\n")

snudda_data = os.path.realpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "snudda_data"))
network_base_path = os.path.realpath("networks")

random_seed = 1234

n_scale = 1
n_dspn = int(np.round(1000*n_scale))
n_ispn = int(np.round(1000*n_scale))
n_fs = int(np.round(40*n_scale))

n_total = n_dspn + n_ispn + n_fs
n_real = int(np.round(200*n_scale))

#sample_dt = 1e-3   # Write only every ms for voltage to data file, to save space
sample_dt = None

neuron_path_list = [os.path.join("neurons", "striatum", "dspn"),
                    os.path.join("neurons", "striatum", "ispn"),
                    os.path.join("neurons", "striatum", "fs")]

connectivity_info = os.path.join(snudda_data, "connectivity", "striatum", "striatum-connectivity.json")

# Important that the mesh has the correct size, because distance dependent connectivity is dependent on the density
mesh_file = os.path.join("mesh", "cube_mesh.obj")
create_cube_mesh(file_name=mesh_file,
                 centre_point=(0, 0, 0),
                 side_len=(n_total/80500.0)**(1/3)*0.001)  # 0.001 convert to meters

network_path = os.path.join(network_base_path, "striatum_with_dopamine")

neuron_paths = [os.path.join(snudda_data, x) for x in neuron_path_list]
    
snd = Snudda(network_path=network_path, parallel=parallel_flag)
snd_init = snd.init_tiny(neuron_paths=neuron_paths,
                         neuron_names=["dSPN", "iSPN", "FS"],
                         number_of_neurons=[n_dspn, n_ispn, n_fs],
                         connection_config=connectivity_info,
                         density=80500,
                         d_min=15e-6,
                         snudda_data=snudda_data,
                         random_seed=random_seed)

snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["reaction_diffusion"] = "reaction_diffusion_D1_empty.json"
snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["modulation"] = "modulation_parameters.json"
snd_init.network_data["regions"]["Cube"]["neurons"]["dSPN"]["modulation_key"] = "abc"

snd_init.network_data["regions"]["Cube"]["neurons"]["iSPN"]["reaction_diffusion"] = "reaction_diffusion_D2_empty.json"
snd_init.network_data["regions"]["Cube"]["neurons"]["iSPN"]["modulation"] = "modulation_parameters.json"
snd_init.network_data["regions"]["Cube"]["neurons"]["iSPN"]["modulation_key"] = "abc"

gaba_param_post_dspn = {"mod_pka_g_min": 1.2,
                        "mod_pka_g_max": 0.8,
                        "mod_pka_g_half": 3.6e-6,
                        "mod_pka_g_slope": 3
                        }

gaba_param_post_ispn = { "mod_pka_g_min": 0.8,
                         "mod_pka_g_max": 1.2,
                         "mod_pka_g_half": 3.6e-6,
                         "mod_pka_g_slope": 3
                        }

snd_init.network_data["regions"]["Cube"]["connectivity"]["dSPN,dSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_dspn)
snd_init.network_data["regions"]["Cube"]["connectivity"]["iSPN,dSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_dspn)
snd_init.network_data["regions"]["Cube"]["connectivity"]["dSPN,iSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_ispn)
snd_init.network_data["regions"]["Cube"]["connectivity"]["iSPN,iSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_ispn)

snd_init.network_data["regions"]["Cube"]["connectivity"]["FS,dSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_dspn)
snd_init.network_data["regions"]["Cube"]["connectivity"]["FS,iSPN"]["GABA"]["channel_parameters"].update(gaba_param_post_ispn)

snd_init.write_json()



