{ pkgs, lib, ... }:

let 

    lsd = "${pkgs.lsd}/bin/lsd";

in

{
    programs.zsh = {
        enable = true;
        package = pkgs.zsh;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        envExtra = "
        HOSTNAME=$(hostname)
        ";
        shellAliases = {
            ls = "${lsd} -l";
            lst = "${lsd} --tree -l";

            cds = "echo \"Disk usage of current dir: $(du . -sh)\"";
        };
    };
}