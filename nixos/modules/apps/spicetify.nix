{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.burntSienna;

      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        lastfm
        fullAppDisplay
        popupLyrics
        skipOrPlayLikedSongs
      ];
    };
}
