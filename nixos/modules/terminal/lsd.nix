{
    programs.lsd = {
        enable = true;
        settings = {
            blocks = [
                "name"
                "date"
                "permission"
            ];

            sorting.dir-grouping = "first";

            date = "+%X %d-%m-%y";
            layout = "grid";
            dereference = false;
            "no-symlink" = true;
            total-size = true;
            hyperlink = "auto";
            header = true;
            permission = "rwx";

        };
    };
}
