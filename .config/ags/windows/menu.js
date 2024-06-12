import device_info from './device_info.js'

const audio = await Service.import("audio");

const Volume = Widget.Box({
    orientation: 0,
    children: [
        Widget.Label({label: ""}),
        Widget.Slider({
            className: "volume_scale",
            draw_value: false,
            hexpand: true,
            on_change: ({ value }) => audio.speaker.volume = value,
            setup: self => self.hook(audio.speaker, () => {
                self.value = audio.speaker.volume || 0
            }),
        })
    ]
})

const VolumeSlider = Widget.Box({
    className: "volume_slider",
    orientation: 1,
    children: [
        Volume,
    ]
})

const Power_Off = Widget.Button({
    label: "󰐥",
    className: "power_button",
    on_clicked: () => {Utils.execAsync("ags -t 'power_warning:sh'"); Utils.execAsync("ags -t 'menu'");}
})

const Power_Restart = Widget.Button({
    label: "",
    className: "power_button",
    on_clicked: () => {Utils.execAsync("ags -t 'power_warning:re'"); Utils.execAsync("ags -t 'menu'");}
})

const Power_Lock = Widget.Button({
    label: "",
    className: "power_button",
    on_clicked: () => {Utils.execAsync("ags -t 'power_warning:sw'"); Utils.execAsync("ags -t 'menu'");}
})

const Power = Widget.Box({
    className: "power_menu",
    orientation: 0,
    spacing: 20,
    hpack: "center",
    children: [
        Power_Off,
        Power_Restart,
        Power_Lock,
    ]
})

const Menu_Container = Widget.Box({
    className: "menu_container",
    orientation: 1,
    children: [
        Widget.Box({
            children: [
                VolumeSlider
            ]
        }),
        Widget.Box({
            children: [
                Power,
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
