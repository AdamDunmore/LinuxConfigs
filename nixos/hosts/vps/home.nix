{ pkgs, ...}:
{
    imports = [
       ../../modules/home.nix 
    ]; 

    adam.apps.minimal = true;
}
