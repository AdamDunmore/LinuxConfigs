{  
  networking.hostName = "vps";

  imports =
    [ 
      ./hardware-configuration.nix
    ];
}
