const greetd = await Service.import("greetd");

function Login(){
    const state = Greeter_Session_Selector.get_active()
    let command = ""
    if (state){
       command = "startplasma-wayland" 
    }
    else{
        command = "sway"
    }
    greetd.login(Greeter_Name.text || '', Greeter_Pwd.text || '', command)
        .catch((err) => {
            Error1.label = JSON.stringify(err)
    })
}

const Greeter_Name = Widget.Entry({
    placeholder_text: "Username",
    on_accept: () => Greeter_Pwd.grab_focus(),
    css: "min-width: 300px;"
})

const Greeter_Pwd = Widget.Entry({
    placeholder_text: "Password",
    visibility: false,
    on_accept: () => {Login()},
    css: "min-width: 300px;"
})

const Greeter_Session_Selector = Widget.Switch({})

const Greeter_Session_Selector_Box = Widget.Box({
    spacing: 10,
    hpack: "center",
    hexpand: true,
    children: [
        Widget.Label({label: "Sway", css: "color: rgba(255,255,255,1);"}),
        Greeter_Session_Selector,
        Widget.Label({label: "Plasma", css: "color: rgba(255,255,255,1);"}),
    ],
})

const Greeter_Box = Widget.Box({
    className: "container",
    orientation: 1,
    hexpand: true,
    vexpand: true,
    spacing: 20,
    hpack: "center",
    vpack: "center",
    children: [
        Greeter_Name,
        Greeter_Pwd,
        Widget.Button({
            label: "Login",
                on_clicked: () => {Login()}
        }),
        Greeter_Session_Selector_Box,
    ],
    css: 'padding: 40px; background-color: rgba(40, 40, 40, 1); border-color: rgba(255,255,255,0.7); border-radius: 10px; border-style: solid; border-width: 2px;'
})

const Greeter = Widget.Window({
    css: "background-color: rgba(20,20,20,255);",
    keymode: "exclusive",
    name: "greeter",
    anchor: ["top", "left", "right", "bottom"],
    child: Greeter_Box
})

App.config({
    style: "./style.css",
    windows: [Greeter]
})
