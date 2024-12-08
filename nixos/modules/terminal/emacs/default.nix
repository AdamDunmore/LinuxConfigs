{ pkgs, config, ...}:

let
  core = import ../../../values/core.nix;
in
{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs;
   };
    services.emacs.enable = true;

    home.file = {
        ".config/emacs/" = {
            enable = true;
            recursive = true;
            source = ./emacs;
        }; 
    };
}
