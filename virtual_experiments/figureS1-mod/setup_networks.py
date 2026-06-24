"""Build two single-dSPN networks for figure S1.

  networks/rxd  — full RxD cascade computes PKAc from bath DA
  networks/mod  — single-species RxD (just DA) as bath input port;
                  Nair_2016_optimized.mod computes the cascade
"""
import os
from snudda import Snudda

SNUDDA_DATA = os.path.join("..", "..", "snudda_data")
NEURON_PATH = os.path.join(SNUDDA_DATA, "neurons", "striatum", "dspn")
RXD_CASCADE = "../../data/JSON/reaction_diffusion_D1_from_SBTab_cal.json"
RXD_DA_ONLY = "../../figures/figureS1-mod/reaction_diffusion_DA_only.json"
MOD_PARAMS_RXD = "../../data/JSON/modulation_parameters-v2.json"
MOD_PARAMS_MOD = "../../figures/figureS1-mod/modulation_parameters_mod.json"


def build(network_dir, modulation_json, rxd_config, extra_mechanisms=None):
    s = Snudda(network_path=network_dir)
    si = s.init_tiny(neuron_paths=NEURON_PATH, neuron_names="dspn",
                     number_of_neurons=[1], random_seed=1234,
                     snudda_data=SNUDDA_DATA)
    n = si.network_data["regions"]["Cube"]["neurons"]["dspn"]
    if rxd_config:
        n["reaction_diffusion"] = rxd_config
    n["modulation"] = modulation_json
    n["modulation_key"] = "abc"
    if extra_mechanisms:
        n["extra_mechanisms"] = extra_mechanisms
    si.write_json()
    s.create_network()


if __name__ == "__main__":
    NAIR = {"soma": ["Nair_2016_optimized"], "basal": ["Nair_2016_optimized"]}
    build("networks/rxd", MOD_PARAMS_RXD, rxd_config=RXD_CASCADE, extra_mechanisms=None)
    build("networks/mod", MOD_PARAMS_MOD, rxd_config=RXD_DA_ONLY, extra_mechanisms=NAIR)

    mech_dir = "mechanisms"
    print()
    print(f"# Prep mechanisms (copies snudda_data mech + figureS1 overrides)")
    print(f"mkdir -p {mech_dir}")
    print(f"cp ../../snudda_data/neurons/mechanisms/*.mod {mech_dir}/")
    print(f"cp ../../figures/figureS1-mod/*.mod {mech_dir}/")
    print(f"nrnivmodl {mech_dir}/")
    print()
    print(f"# Run")
    print(f"snudda simulate networks/rxd --time 2 --simulation_config sim_rxd.json "
          f"--mechdir {mech_dir} --enable_rxd_neuromodulation")
    print(f"snudda simulate networks/mod --time 2 --simulation_config sim_mod.json "
          f"--mechdir {mech_dir} --enable_rxd_neuromodulation")
