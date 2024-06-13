const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");
const power_profiles = await Service.import("powerprofiles");

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

function toggleProfiles(){
    switch(power_profiles.active_profile){
        case 'balanced':
            power_profiles.active_profile = 'performance';
            break;
        case 'performance':
            power_profiles.active_profile = 'power-saver';
            break;
        case 'power-saver':
            power_profiles.active_profile = 'balanced';
            break;
        default:
            power_profiles.active_profile = 'balanced';
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

const PowerProfile = Widget.Button({
    className: "quick_setting_power",
    label: power_profiles.bind('active_profile'),
    on_clicked: () => toggleProfiles()
})

const Settings = Widget.Box({
    orientation: 0,
    children: [
        Wifi,
        Bluetooth,
    ]
})

export default Settings;
