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

const DeviceInfo = Widget.Box({
    className: "device_info",
    orientation: 1,
    children: [
        Volume,
    ]
})

const Power_Off = Widget.Button({
    label: "󰐥",
    on_clicked: (s) => {Utils.execAsync("ags -t 'power_warning:sh'"); Utils.execAsync("ags -t 'menu'");}
})

const Power_Restart = Widget.Button({
    label: "",
    on_clicked: (s) => {Utils.execAsync("ags -t 'power_warning:re'"); Utils.execAsync("ags -t 'menu'");}
})

const Power_Lock = Widget.Button({
    label: "",
    on_clicked: (s) => {Utils.execAsync("ags -t 'power_warning:sw'"); Utils.execAsync("ags -t 'menu'");}
})

const Power = Widget.Box({
    className: "power_menu",
    orientation: 0,
    spacing: 20,
    children: [
        Power_Off,
        Power_Restart,
        Power_Lock,
    ]
})

const Menu_Container = Widget.FlowBox({
    className: "menu_container"
})
Menu_Container.add(DeviceInfo);
Menu_Container.add(Power);

const Menu = Widget.Window({
    name: "menu",
    monitor: 1,
    className: "menu_window",
    child: Menu_Container
})

export default Menu;
