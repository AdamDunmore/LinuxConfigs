{ config, pkgs, ... }:

{
  imports = [ 
  	./hardware-configuration.nix
	../../modules/main.nix
  ];

  # To allow you to properly use and access your VPS via SSH, we enable the OpenSSH server and
  # grant you root access. This is just our default configuration, you are free to remove root
  # access, create your own users and further secure your server.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Under normal circumstances we would listen to your server's cloud-init callback and mark the server
  # as installed at this point. As we don't deliver cloud-init with NixOS we have to use a workaround
  # to indicate that your server is successfully installed. You can 
  services.cron.enable = true;
  services.cron.systemCronJobs = [
    "@reboot root sleep 30 && curl -L -XPOST -q https://portal.servinga.cloud/api/service/v1/cloud-init/callback > /dev/null 2>&1"
  ];
}
