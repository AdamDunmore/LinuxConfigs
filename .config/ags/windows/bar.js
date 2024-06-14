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

const Clock = Widget.Box({
    child: Widget.Label({
        setup: (self) => {
            Utils.interval(1000, () => {
                self.set_label(getTime())
            })
        }
    })
})

const Calendar = Widget.Box({
    child: Widget.Label({
        setup: (self) => {
            Utils.interval(1000, () => {
                self.set_label(getCalendar())
            })
        }
    })
})

const Left = Widget.Box({
    hpack: "start", 
    hexpand: true,
    spacing: 10,

})

const Middle = Widget.Box({
    hpack: "center",
    hexpand: true,
    spacing: 10,
    children: [
        Clock,
        Calendar
    ]

})

const Right = Widget.Box({
    hpack: "end", 
    hexpand: true,
    spacing: 10,
})

const Bar = Widget.Window({
    name: "bar",
    hexpand: true,
    css: "background-color: red;",
    anchor: ["left", "top", "right"],
    child: Widget.Box({
        hexpand: true,
        children: [
            Left,
            Middle,
            Right
        ]
    })
})

export default Bar
