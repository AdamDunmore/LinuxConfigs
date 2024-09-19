{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.BurntSienna;

      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        adblock
        lastfm
        fullAppDisplay
        popupLyrics
        skipOrPlayLikedSongs
      ];
    };
}
