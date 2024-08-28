{ pkgs, ... }:

let

core = import ../../values/core.nix;

in
{
    users.users."${core.user}" = {
        isNormalUser = true;
        description = "Adam Dunmore";
        extraGroups = [ "networkmanager" "wheel" "audio" "dialout"];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
    };
}
