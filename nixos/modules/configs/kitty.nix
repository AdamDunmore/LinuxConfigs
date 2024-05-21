{ pkgs, lib, ... }:

{
    programs.kitty = {
	    enable = true;
	    font = {
		    name = "CodeNewRoman";
		    size = 12;
        };

        extraConfig = "
            background #222244
            editor nvim
            shell zsh
            confirm_os_window_close 0
        ";
    };
}
