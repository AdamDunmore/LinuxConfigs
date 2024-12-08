{ config, ... }:

let

core = import ../../../values/core.nix;

in

{
    home.file = {
        ".config/nvim" = {
            source = ./nvim;
            recursive = true;
        }; 
    };
}
