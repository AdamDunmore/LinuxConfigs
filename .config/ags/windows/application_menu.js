// Code heavily inspired by https://github.com/Aylur/ags/blob/main/example/applauncher/applauncher.js

const applications = await Service.import("applications")

const App_Entry = app => Widget.Button({
    on_clicked: () => {
        App_Launcher.hide()
        app.launch()
    },
    attribute: { app },
    label: app.name
})

let query = "";
const apps = applications.query("").map(App_Entry)

const App_Launcher = Widget.Window({
    name: "app_launcher",
    layer: "top",
    monitor: 1,
    keymode: "on-demand",
    child: Widget.Box({
        children: [
            Widget.Entry({
                hexpand: true,
                placeholder_text: 'Drun',
                on_change: ({ text }) => apps.forEach(item => {
                    item.visible = item.attribute.app.match(text ?? "")
                }),
                css: "min-height: 60px; min-width: 100px; background-color: blue;"
            }),
            Widget.Scrollable({
                hscroll: "never",
                child: Widget.Box({
                    orientation: 1,
                    css: "background-color: red;",
                    children: apps
                })
            })
        ]
    })
})

export default App_Launcher
