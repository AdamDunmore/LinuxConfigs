import menu from './windows/menu.js'
import power_warning from './windows/power_warning.js'
import app_launcher from './windows/application_menu.js'
import bar from './windows/bar.js'
import notifications from './windows/notifications.js'


const Menu = menu;
const Power_Warning_SH = power_warning("shutdown now");
const Power_Warning_RE = power_warning("reboot");
const Power_Warning_SW = power_warning("swaylock -C ~/.config/sway/swaylock");
const App_Launcher = app_launcher;
const Bar = bar;
const Notifications = notifications;

App.config({
    style: "./style.css",
    windows: [
        Menu,
        Power_Warning_SH,
        Power_Warning_RE,
        Power_Warning_SW,
        App_Launcher,
        Bar,
        Notifications,
    ]
})

Menu.hide()
Power_Warning_SH.hide()
Power_Warning_RE.hide()
Power_Warning_SW.hide()
App_Launcher.hide()
Bar.hide()


