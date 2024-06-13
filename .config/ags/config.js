import menu from './windows/menu.js'
import power_warning from './windows/power_warning.js'
import app_launcher from './windows/application_menu.js'

let Menu = menu;
let Power_Warning_SH = power_warning("shutdown now");
let Power_Warning_RE = power_warning("reboot");
let Power_Warning_SW = power_warning("swaylock -C ~/.config/sway/swaylock");
let App_Launcher = app_launcher

App.config({
    style: "./style.css",
    windows: [
        Menu,
        Power_Warning_SH,
        Power_Warning_RE,
        Power_Warning_SW,
        App_Launcher
    ]
})

Menu.hide()
Power_Warning_SH.hide()
Power_Warning_RE.hide()
Power_Warning_SW.hide()
App_Launcher.hide()


