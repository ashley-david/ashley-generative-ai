def build_ccg(repo_name):
    return {
        "nodes": ["train_model", "load_data", "evaluate"],
        "edges": [
            {"from": "train_model", "to": "load_data", "type": "calls"},
            {"from": "evaluate", "to": "train_model", "type": "calls"}
        ]
    }