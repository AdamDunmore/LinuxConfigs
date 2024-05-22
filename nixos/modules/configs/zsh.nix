{ pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableAutosuggestions = true;
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
