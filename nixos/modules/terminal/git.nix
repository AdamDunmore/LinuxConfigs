{ pkgs, ... }:

{
    #Git credential helper setup
    programs.git = {
        enable = true;
        userName = "Adam Dunmore";
        userEmail = "adamfdunmore@gmail.com";
    };
}
