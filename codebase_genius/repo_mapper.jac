walker repo_mapper {
    has repo_url;
    has repo_path;
    has readme_summary;
    has file_tree;

    can run {
        repo_path = clone_repo(repo_url);
        file_tree = generate_file_tree(repo_path);
        readme_summary = summarize_readme(repo_path);
        set_attr("readme_summary", readme_summary);
        set_attr("file_tree", file_tree);
    }

    can clone_repo {
        py_call("repo_tools.clone_repo", repo_url);
    }

    can generate_file_tree {
        py_call("repo_tools.file_tree", repo_path);
    }

    can summarize_readme {
        py_call("repo_tools.summarize_readme", repo_path);
    }
}

