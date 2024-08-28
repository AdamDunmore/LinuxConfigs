{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.BurntSienna;

      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        adblock
        lastfm
      ];
    };
}
