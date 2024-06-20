{ config, pkgs, pkgs-unstable, hyprland, ... }:

{
  networking.hostName = "desktop";

  imports =
    [       
      ./hardware-configuration.nix
      ../../modules/main.nix
    ];

  # Enables AMD GPU drivers
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
    ];
  };

  # Add ntfs support
  boot.supportedFilesystems = [ "ntfs" ];
}
