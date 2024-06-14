// Code heavily inspired by https://github.com/Aylur/ags/blob/main/example/applauncher/applauncher.js
const applications = await Service.import("applications")

let active = 0;

const App_Entry = app => Widget.Button({
    child: Widget.Box({
        spacing: 10,
        children: [
            Widget.Icon({
                className: "app_menu_entry_icon",
                icon: app.icon_name
            }),
            Widget.Label({
                className: "app_menu_entry_text",
                label: app.name
            })
        ]
    }),
    className: "app_menu_entry",
    on_clicked: () => {
        App_Launcher.hide()
        app.launch()
    },
    attribute: { app },
})

const apps = applications.query("").map(App_Entry)

const App_Input = Widget.Entry({
    className: "app_menu_input",
    hexpand: true,
    on_change: ({ text }) => apps.forEach(item => {
        item.visible = item.attribute.app.match(text ?? "")
        active = 0
        setActive()
    }),
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
    else if (keyval == 65362){ //Up arrow key
       setActive("-") 
    } 
    else if (keyval == 65364){ //Down Arrow Key
        setActive("+")
    }
    else if (keyval == 65293){ //Enter key
        const results = apps.filter((item) => item.visible);
        results[active].attribute.app.launch();
        close()
    } 
})

function close(){
    App_Launcher.hide()
    App_Input.set_text("")
}

function setActive(state){
    const results = apps.filter((item) => item.visible);
    results[active].class_name = "app_menu_entry"    
    if (state == "+"){
        active += 1
    }
    else if (state == "-"){
        active -= 1
    }
    if(active < 0){
        active = 0
    }
    results[active].class_name = "app_menu_entry active"
}setActive()

export default App_Launcher
