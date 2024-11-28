{ pkgs, ...}:

{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs;
        extraPackages = pkgs: with pkgs.emacsPackages; [
            # doom
            # general
            # evil
        ];
    };
    services.emacs.enable = true;
}
