{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            format = "[ ](#3B4252)$username[](fg:#3B4252 bg:#4C566A)$directory[ ](#4C566A)";
            username = {
                style_user = "bg:#3B4252 fg:#D8DEE9";
                disabled = false;
                show_always = true;
                format = "[$user ]($style)";
            };
            directory = {
                format = "[ $path ]($style)";
                style = "bg:#4C566A fg:#D8DEE9";
            };
        };
    };
}
