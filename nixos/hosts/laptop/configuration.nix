{  
  networking.hostName = "laptop";

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/main.nix
    ];
}
