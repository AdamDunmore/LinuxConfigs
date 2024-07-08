{ pkgs, ... }:

{
    dconf = {
        enable = true;
        settings = {
            "org/gnome/shell" = {
                enabled-extensions = with pkgs.gnomeExtensions; [
                    bluetooth-quick-connect.extensionUuid
                    clipboard-indicator.extensionUuid
                    dash-to-panel.extensionUuid
                    user-themes.extensionUuid
                ];
                disable-user-extensions = false;
                "favorite-apps" = ["firefox.desktop" "org.gnome.Nautilus.desktop" "Alacritty.desktop"]; 
            };

            "org/gnome/shell/extensions/user-theme" = {
                name = "Nordic";
            };

            "org/gnome/nautilus" = {
                "default-folder-viewer" = "list-view";
                "default-visible-columns" = ["name" "size" "type" "date_modified"];
            };
        };
    };
}
