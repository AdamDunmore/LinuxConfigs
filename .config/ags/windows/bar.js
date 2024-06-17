import backlight from '../services/brightness.js'
import workspace from '../services/workspaces.js'
const audio = await Service.import('audio')
const battery = await Service.import('battery')
const network = await Service.import('network')

function getTime(){
    const date = new Date()
    const hour = date.getHours()
    const min = date.getMinutes()
    return `${hour}:${min}`
}

function getCalendar(){
    const date = new Date()
    const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct, Dec"]
    const day = weekday[date.getDay()]
    const date_day = date.getDate()
    const date_month = months[date.getMonth()]
    const date_year = date.getFullYear()
    return `${day}, ${date_day} ${date_month} ${date_year}`
}

const Backlight = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        label: backlight.bind('screen_value').as(v => `󰃠\t${Math.floor(v*100)}%`),
        visible: backlight.bind('available') //Fix when able to test
    })
})

const Volume = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        label: audio["speaker"].bind('volume').as(v => `\t${Math.round(v * 100)}%`)
    })
})

const Battery = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        label: battery.bind("percent").as(v => `\t${v}%`),
        visible: battery.bind("available")
    })
})

const Network = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        label: network.bind("wifi").as(v => `\t${v.strength}%`)
    })
})

const Clock = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        setup: (self) => {
            Utils.interval(1000, () => {
                self.set_label(getTime())
            })
        }
    })
})

const Calendar = Widget.Box({
    className: "bar_item",
    child: Widget.Label({
        setup: (self) => {
            Utils.interval(1000, () => {
                self.set_label(getCalendar())
            })
        }
    })
})

const Workspace = Widget.Box({
    className: "bar_item bar_workspace",
    child: Widget.Label({
        label: workspace.bind("workspace-active").as(v => `${v}`)
    })
})

const Menu = Widget.Box({
    child: Widget.Button({
        className: "bar_item bar_menu",
        label: "󰍜",
        on_clicked: () => {
            Utils.execAsync('ags -t "menu"')
        }
    })
})

const Left = Widget.Box({
    className: "bar_left",
    hexpand: true,
    hpack: "start",
    spacing: 10,
    children: [
        Workspace
    ]

})

const Middle = Widget.Box({
    hpack: "center",
    spacing: 10,
    children: [
        Clock,
        Calendar
    ]

})

const Right = Widget.Box({
    className: "bar_right",
    hexpand: true,
    hpack: "end",
    spacing: 10,
    children: [
        Backlight,
        Volume,
        Battery,
        Network,
        Menu,
    ]
})

const BarBox = Widget.CenterBox({
    hexpand: true,
    startWidget: Left,
    centerWidget: Middle,
    endWidget: Right
})

const Bar = Widget.Window({
    name: "bar",
    hexpand: true,
    className: "bar",
    anchor: ["left", "top", "right"],
    child: BarBox
})


export default Bar
