{ pkgs, lib, ... }:

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
    };
}
