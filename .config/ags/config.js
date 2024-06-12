import menu from './windows/menu.js'

const Container = Widget.FlowBox({
    className: "container"
})
Container.add(menu);

const Parent = Widget.Window({
    monitor: 1,
    name: 'ags',
    child: Container,
})

App.config({
    style: "./style.scss",
    windows: [Parent]
})
