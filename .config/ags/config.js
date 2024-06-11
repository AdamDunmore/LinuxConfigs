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
    on_clicked: () => {Utils.exec("shutdown now")} 
})

const Power_Restart = Widget.Button({
    label: "",
    on_clicked: () => {Utils.exec("reboot")} 
})

const Power_Lock = Widget.Button({
    label: "",
    on_clicked: () => {Utils.exec("swaylock -C ~/.config/sway/swaylock")} 
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

const Container = Widget.FlowBox({
    className: "container"
})
Container.add(DeviceInfo);
Container.add(Power);

const Menu = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `menu${monitor}`,
//    anchor: ['top', 'left', 'bottom', 'right'],
    child: Container
})

App.config({
    style: "./style.scss",
    windows: [Menu(1)],
})
