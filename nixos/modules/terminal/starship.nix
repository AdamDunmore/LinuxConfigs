let 

colour1 = "#81A1C1";
colour2 = "#5E81AC";
colour_text = "#D8DEE9";

colours = import ../../values/colours.nix;

in

{    
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            format = "[ ](${colours.light_blue.one})$username[](fg:${colours.light_blue.one} bg:${colours.light_blue.two})$directory[ ](${colours.light_blue.two})";
            add_newline = false;
            username = {
                style_user = "bg:${colours.light_blue.one} fg:${colours.white.one}";
                disabled = false;
                show_always = true;
                format = "[$user ]($style)";
            };
            directory = {
                format = "[ $path ]($style)";
                style = "bg:${colours.light_blue.two} fg:${colours.white.one}";
            };
        };
    };
}
