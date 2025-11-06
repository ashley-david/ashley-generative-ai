walker doc_genie {
    has readme_summary;
    has file_tree;
    has ccg;

    can run {
        py_call("docgen.generate_markdown", readme_summary, file_tree, ccg);
    }
}
