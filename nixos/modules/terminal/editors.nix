{ lib, config, pkgs, ... }:

let
  cfg = config.adam.terminal.editors;
in
with lib;
{
  options.adam.terminal.editors = {
    default = mkOption {
      type = types.str;
      default = "${pkgs.nano}/bin/nano";
      example = "\${pkgs.nano}/bin/nano";
      description = "The binary for your default editor";
    };
    emacs = mkEnableOption "Enable Emacs";
    nvim = mkEnableOption "Enable Neovim";
  };
  
  config = mkMerge [
    ( mkIf cfg.emacs {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs;
      };
      services.emacs.enable = true;

      home.file = {
        ".config/emacs/" = {
            enable = true;
            recursive = true;
            source = ./emacs/emacs;
        };
      };
    })
    ( mkIf cfg.nvim {
      home.file = {
        ".config/nvim" = {
          source = ./nvim/nvim;
          recursive = true;
        };
      };
    })
    { home.sessionVariables = { ADAM_EDITOR = cfg.default; }; }
  ];   
}
