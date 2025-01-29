{ pkgs, ... }:

{
    networking.hostName = "desktop";

    imports = [       
        ./hardware-configuration.nix
        ../../modules/main.nix
    ];

    # Enables AMD GPU drivers
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware = {
        graphics = {
            enable = true;
            extraPackages = with pkgs; [
                vulkan-loader
                vulkan-validation-layers
                vulkan-extension-layer
            ];
            enable32Bit = true; # Needed for steam
        };
    };

    # Add ntfs support
    boot.supportedFilesystems = [ "ntfs" ];
}
