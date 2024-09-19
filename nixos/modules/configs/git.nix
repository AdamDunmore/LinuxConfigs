{ pkgs, ... }:

{
    #Git credential helper setup
    programs.git = {
        enable = true;
        userName = "Adam Dunmore";
        userEmail = "adamfdunmore@gmail.com";
        extraConfig = {
            credential.helper = "${
                pkgs.git.override { withLibsecret = true; }
            }/bin/git-credential-libsecret";
        };
    };
}
