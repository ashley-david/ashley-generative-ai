import repo_mapper.jac
import code_analyzer.jac
import doc_genie.jac

walker code_genius {
    has repo_url;
    has repo_name;
    has readme_summary;
    has file_tree;
    has ccg;

    entry {
        repo_url = args[0];
        repo_name = py_call("utils.extract_repo_name", repo_url);

        walk repo_mapper with repo_url;
        readme_summary = get_attr("readme_summary");
        file_tree = get_attr("file_tree");

        walk code_analyzer with repo_name;
        ccg = get_attr("ccg");

        walk doc_genie with readme_summary, file_tree, ccg, repo_name;
    }
}

