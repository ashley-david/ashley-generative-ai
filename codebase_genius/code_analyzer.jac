walker code_analyzer {
    has repo_name;
    has ccg;

    can run {
        ccg = py_call("code_parser.build_ccg", repo_name);
        set_attr("ccg", ccg);
    }
}
