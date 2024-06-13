{ pkgs, pkgs-unstable, ... }:

{

  # Bootloader
  boot.loader = {
  	efi.canTouchEfiVariables = true; 	
	grub = {
		enable = true;
		device = "nodev";
		useOSProber = true;
		efiInstallAsRemovable = false;
		efiSupport = true;
		splashImage = /home/adam/Pictures/wallpaper.png;
	};

  	systemd-boot.enable = false;   
  };


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking
  networking.networkmanager.enable = true;

  #Enable Bluetooth 
  hardware.bluetooth = {
  	enable = true;
	powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "uk";

  #Enables Enviroments
  services.xserver = {
    xkb = {
        variant = "";
        layout = "gb";
    };
	enable = true;

    desktopManager.plasma5.enable = true;
  };

  services = {
    libinput.enable = true;
    printing.enable = true;
    power-profiles-daemon.enable = true;
    displayManager.sddm.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adam = {
    isNormalUser = true;
    description = "Adam Dunmore";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
  ];

  system.stateVersion = "24.05";
	
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    steam.enable = true;
    sway.enable = true;
  };
}
