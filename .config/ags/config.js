import menu from './windows/menu.js'
import power_warning from './windows/power_warning.js'
import app_launcher from './windows/application_menu.js'
import bar from './windows/bar.js'


let Menu = menu;
let Power_Warning_SH = power_warning("shutdown now");
let Power_Warning_RE = power_warning("reboot");
let Power_Warning_SW = power_warning("swaylock -C ~/.config/sway/swaylock");
let App_Launcher = app_launcher
let Bar = bar

App.config({
    style: "./style.css",
    windows: [
        Menu,
        Power_Warning_SH,
        Power_Warning_RE,
        Power_Warning_SW,
        App_Launcher,
        Bar,
    ]
})

Menu.hide()
Power_Warning_SH.hide()
Power_Warning_RE.hide()
Power_Warning_SW.hide()
App_Launcher.hide()
Bar.hide()


