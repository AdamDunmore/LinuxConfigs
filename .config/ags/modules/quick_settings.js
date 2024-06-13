const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");


function toggleWifi(active){
    if(network.wifi.enabled != active){
       network.toggleWifi() 
    }
}

function toggleBluetooth(active){
    if(bluetooth.enabled != active){
        bluetooth.toggle()
    }
}

const Wifi = Widget.ToggleButton({
    className: "quick_setting",
    label: "󰖩",
    onToggled: (state) => toggleWifi(state.active),
    setup: (self) => {
        Utils.interval(1000, () => {
            if (network.wifi.enabled == true){
                self.set_active(true)
            }
            else{
                self.set_active(false)
            }
        })
    }
})

const Bluetooth = Widget.ToggleButton({
    className: "quick_setting",
    label: "",
    onToggled: (state) => toggleBluetooth(state.active),
    setup: (self) => {
        Utils.interval(1000, () => {
            if (bluetooth.enabled == true){
                self.set_active(true)
            }
            else{
                self.set_active(false)
            }
        })
    }
})

const Settings = Widget.Box({
    orientation: 0,
    children: [
        Wifi,
        Bluetooth
    ]
})

export default Settings;
