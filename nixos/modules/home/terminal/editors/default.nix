{ lib, config, pkgs, ... }:

let
  cfg = config.adam.terminal.editors;
in
with lib;
{ 
  config = mkMerge [
    ( mkIf cfg.emacs {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs;
      };
      services.emacs.enable = true;

      home.file = {
        ".config/emacs/" = {
            recursive = true;
            source = ./emacs;
        };
      };
    })
    ( mkIf cfg.nvim {
      programs.neovim.plugins = [ (pkgs.vimPlugins.nvim-treesitter.withAllGrammars) ];
      home.file = {
        ".config/nvim/" = {
          source = ./nvim;
          target = ".config/nvim";
          recursive = true;
        };
      };
    })
    { home.sessionVariables = { ADAM_EDITOR = cfg.default; }; }
  ];   
}
