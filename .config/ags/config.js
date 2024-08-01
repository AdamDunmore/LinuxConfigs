import menu from './windows/menu.js'
import power_warning from './windows/power_warning.js'
import app_launcher from './windows/application_menu.js'
import bar from './windows/bar.js'
import notifications from './windows/notifications.js'
import bluetooth_menu from './windows/bluetooth_menu.js'

const Power_Warning_SH = power_warning("shutdown now");
const Power_Warning_RE = power_warning("reboot");
const Power_Warning_SW = power_warning("swaylock -C ~/.config/sway/swaylock");

App.config({
    style: "./style.css",
    windows: [
        Power_Warning_SH,
        Power_Warning_RE,
        Power_Warning_SW,
        menu,
        app_launcher,
        bar,
        notifications,
        bluetooth_menu,
    ]
})


Power_Warning_SH.hide()
Power_Warning_RE.hide()
Power_Warning_SW.hide()
app_launcher.hide()
menu.hide()
bluetooth_menu.hide()

