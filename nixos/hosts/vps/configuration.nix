let 
    core = import ../../values/core.nix;

in
{  
    networking.hostName = "vps";

    imports = [ 
      ./hardware-configuration.nix
    ];

    system.stateVersion = "${core.version}";	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
