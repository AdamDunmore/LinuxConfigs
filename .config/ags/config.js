import menu from './windows/menu.js'
import power_warning from './windows/power_warning.js'

let Menu = menu;
let Power_Warning_SH = power_warning("shutdown now");
let Power_Warning_RE = power_warning("reboot");
let Power_Warning_SW = power_warning("swaylock -C ~/.config/sway/swaylock");

App.config({
    style: "./style.css",
    windows: [
        Menu,
        Power_Warning_SH,
        Power_Warning_RE,
        Power_Warning_SW,
    ]
})

Menu.hide()
Power_Warning_SH.hide()
Power_Warning_RE.hide()
Power_Warning_SW.hide()


