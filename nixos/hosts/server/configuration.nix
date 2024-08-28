{ pkgs, ...}:

let

core = import ../../values/core.nix;

in

{  
  networking.hostName = "server";

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system/bootloader.nix
      ../../modules/system/keyboard.nix
      # ../../modules/system/syncthing.nix
      ../../modules/system/timezone.nix
      ../../modules/system/users.nix
    ];

  
    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Downloading Nerd Font
    fonts.packages = with pkgs; [
	    (nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    ];

    # Enable networking
    networking.networkmanager.enable = true;
}
