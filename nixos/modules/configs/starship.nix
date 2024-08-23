let 

colour1 = "#81A1C1";
colour2 = "#5E81AC";
colour_text = "#D8DEE9";

in

{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            format = "[ ](${colour1})$username[](fg:${colour1} bg:${colour2})$directory[ ](${colour2})";
            add_newline = false;
            username = {
                style_user = "bg:${colour1} fg:${colour_text}";
                disabled = false;
                show_always = true;
                format = "[$user ]($style)";
            };
            directory = {
                format = "[ $path ]($style)";
                style = "bg:${colour2} fg:${colour_text}";
            };
        };
    };
}
