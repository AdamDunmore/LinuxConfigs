{ config, ... }:

let

core = import ../../../values/core.nix;

in

{
    home.file = {
        ".config/ags" = {
            source = ./ags;
        }; 
    };
}
