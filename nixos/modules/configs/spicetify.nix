{ pkgs, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
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
