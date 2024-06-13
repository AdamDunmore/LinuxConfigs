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

export default Power
