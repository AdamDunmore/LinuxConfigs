{ pkgs, lib, config, ... }:

let
  cfg = config.adam.terminal.shell;
in
with lib;
{
  config = mkIf cfg {
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

            nix-switch = "sudo nixos-rebuild switch --flake";
            nix-test = "sudo nixos-rebuild test --fast --flake";

            emacs = "emacs -nw --init-directory ~/.config/emacs";
        };
    };
  }; 
}
