import json

def generate_reaction_chain_json(n: int) -> dict:
    species = {
        f"reactant_{i}": {
            "initial_concentration": 0.01 if i == 1 else 30,
            "diffusion_constant": 0,
            "charge": 0,
            "regions": ["soma_internal", "dend_internal"],
            "concentration": 0.01 if i == 1 else 30,
        }
        for i in range(1, n + 1)
    }

    reactions = {
        f"revreaction_{i}_{i+1}": {
            "reactants": f"reactant_{i}",
            "products": f"reactant_{i+1}",
            "forward_rate": 0.05,
            "backward_rate": 250.0,
            "regions": ["soma_internal", "dend_internal"],
        }
        for i in range(1, n)
    }

    return {"species": species, "reactions": reactions}



if __name__ == '__main__':
    lengths = [2**i for i in range(1,8)]
    lengths.append(100)
    
    for n in lengths:
        cfg = generate_reaction_chain_json(n=n)

        with open(f"reactions_{n}.json", "w") as f:
            json.dump(cfg, f, indent=4)

