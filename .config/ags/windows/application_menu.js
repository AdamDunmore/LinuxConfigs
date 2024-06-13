// Code heavily inspired by https://github.com/Aylur/ags/blob/main/example/applauncher/applauncher.js
const applications = await Service.import("applications")

const App_Entry = app => Widget.Button({
    className: "app_menu_entry",
    on_clicked: () => {
        App_Launcher.hide()
        app.launch()
    },
    attribute: { app },
    label: app.name
})

const apps = applications.query("").map(App_Entry)

const App_Input = Widget.Entry({
    className: "app_menu_input",
    hexpand: true,
    on_change: ({ text }) => apps.forEach(item => {
        item.visible = item.attribute.app.match(text ?? "")
    }),
    on_accept: (self) => {
        const results = apps.filter((item) => item.visible);
        if (results[0]){
            close()
            results[0].attribute.app.launch()
        }
    },
})

const App_Launcher = Widget.Window({
    name: "app_launcher",
    layer: "top",
    monitor: 1,
    keymode: "exclusive",
    child: Widget.Box({
        className: "app_menu_container",
        orientation: 1,
        children: [
            App_Input,
            Widget.Scrollable({
                vexpand: true,
                hscroll: "never",
                child: Widget.Box({
                    orientation: 1,
                    children: apps
                })
            })
        ]
    })
})

App_Launcher.connect("key_press_event", (s, t) => {
    let keyval = t.get_keyval()[1];
    if (keyval == 65307){ //If key is escape then close
        close()
    }
})

function close(){
    App_Launcher.hide()
    App_Input.set_text("")
}

export default App_Launcher
