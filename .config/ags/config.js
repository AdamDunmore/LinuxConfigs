const audio = await Service.import("audio");

import brightness from './services/brightness.js'

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

const Brightness = Widget.Box({
    orientation: 0,
    children: [
        Widget.Label({label: "󰃠"}),
        Widget.Slider({
            className: "brightness_scale",
            draw_value: false,
            hexpand: true,
            value: brightness.screen_value,
        })
    ]
})

const DeviceInfo = Widget.Box({
    className: "device_info",
    orientation: 1,
    children: [
        Volume,
        Brightness 
    ]
})

const Container = Widget.FlowBox({
    className: "container"
})
Container.add(DeviceInfo);

const Menu = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `menu${monitor}`,
    anchor: ['top', 'left', 'bottom', 'right'],
    child: Container
})

App.config({
    style: "./style.scss",
    windows: [Menu(0)],
})
