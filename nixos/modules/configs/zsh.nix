{ pkgs, lib, ... }:

let 

    lsd = "${pkgs.lsd}/bin/lsd";

in

{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
        };
        envExtra = "
        HOSTNAME=$(hostname)
        ";
        shellAliases = {
            ls = "${lsd} -l";
            lst = "${lsd} --tree -l";
        };
    };
}
