let

core = import ../../values/core.nix;

in

{
    services.syncthing = {
        enable = true;
        user = core.user;
        dataDir = "/home/${core.user}/Documents/";
        configDir = "/home/${core.user}/.config/syncthing/";
        overrideFolders = true;
        overrideDevices = true;

        settings = {
            devices = {
                # "server" = { id = ""; };
                "desktop" = { id = "BUUBAHB-J32JMCM-XMM6TA5-L3RT7IK-73NZNID-3K3VSIQ-GOWRST2-CUSVJAO"; };
                "laptop" = { id = "3QDOA7N-HNVYBEV-WHCA6EX-KSSL6O4-ECRELZ7-YVG2CKI-OTZ3AID-GZ2LMAL"; };
            };

            folders = {
                "University" = {
                    path = "/home/${core.user}/Documents/Data";
                    devices = [ "desktop" "laptop" ]; #"server"
                    ignorePerms = false;
                };
            };
        };
    };
}
