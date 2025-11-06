import os
import git
import json
import openai

openai.api_key = os.getenv("OPENAI_API_KEY")

def clone_repo(repo_url):
    repo_name = repo_url.split("/")[-1]
    path = f"./repos/{repo_name}"
    if not os.path.exists(path):
        git.Repo.clone_from(repo_url, path)
    return path

def file_tree(path):
    tree = {}
    for root, dirs, files in os.walk(path):
        dirs[:] = [d for d in dirs if d not in ['.git', 'node_modules', '__pycache__']]
        rel_root = os.path.relpath(root, path)
        tree[rel_root] = files
    return json.dumps(tree, indent=2)

def summarize_readme(path):
    readme_path = os.path.join(path, "README.md")
    if not os.path.exists(readme_path):
        return "No README.md found in the repository."
    with open(readme_path, "r", encoding="utf-8") as f:
        content = f.read()
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a helpful assistant that summarizes README files."},
            {"role": "user", "content": f"Summarize this README:\n{content}"}
        ],
        temperature=0.7
    )
    return response.choices[0].message["content"]
