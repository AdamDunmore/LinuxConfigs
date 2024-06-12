import power_menu from './power_warning.js'

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
    on_clicked: (s) => {print(typeof(power_menu("S"))); s.parent.parent.add(power_menu("shutdown now"));} 
})

const Power_Restart = Widget.Button({
    label: "",
    on_clicked: () => {Utils.exec("reboot")} 
})

const Power_Lock = Widget.Button({
    label: "",
    on_clicked: () => {Utils.exec("swaylock -C ~/.config/sway/swaylock");} 
})

const Power = Widget.Box({
    className: "power_menu",
    orientation: 0,
    spacing: 20,
    children: [
        Power_Off,
        Power_Restart,
        Power_Lock
    ]
})

const Menu = Widget.FlowBox({
    className: "menu_container"
})
Menu.add(DeviceInfo);
Menu.add(Power);

export default Menu;
