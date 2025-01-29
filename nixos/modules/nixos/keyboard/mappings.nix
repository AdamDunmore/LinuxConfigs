{ lib, config, ... }:

let
  cfg = config.adam.keyboard;
in
with lib;
{
    config = mkIf cfg.custom_layout {
        # Too fix
        # hardware.uinput.enable = true;
        # services.evdevremapkeys = {
        #     enable = true;
        #     settings = {
        #         devices = [
        #             { 
        #                 input_name = "EasySMX EasySMX X10";
        #                 output_name = "remap-controller";
        #                 remappings = {
        #                     BTN_SOUTH = [ "KEY_Z" ];
        #                 };
        #             }
        #                 # input = "/dev/input/event6";
        #                 # grab = true;
        #                 # remappings = [
        #                 #     { from = "BTN_SOUTH"; to = "KEY_S"; }
        #                 # ];
        #         ];
        #     };
        # };
        services.keyd = {
            enable = true;
            keyboards.default = {
                settings = {
                    main = {
                        capslock = "layer(renamed)";

                    };
                    renamed = {
                        esc = "`"; 
                        z = "102nd"; # \
                        p = "G-102nd"; # |
                        c = "capslock";
                    };
                };
            };
        };   
    };
}
