{
    # Enable VirtualBox TODO: Move to own file
    virtualisation.virtualbox = {
        host.enable = true;
        guest = {
            enable = true;
            draganddrop = true;
        };
    };
    users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
