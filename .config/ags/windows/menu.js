import device_info from '../modules/device_info.js'
import power_menu from '../modules/power_menu.js'
import volume_slider from '../modules/volume_slider.js'

const Menu_Container = Widget.Box({
    className: "menu_container",
    orientation: 1,
    children: [
        Widget.Box({
            children: [
                volume_slider
            ]
        }),
        Widget.Box({
            children: [
                power_menu,
                device_info
            ]
        })
    ]
})

const Menu = Widget.Window({
    name: "menu",
    monitor: 1,
    className: "menu_window",
    child: Menu_Container
})

export default Menu;
