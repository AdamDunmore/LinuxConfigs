const Power_Warning = function(operation){
    return Widget.Box({
        children: [
            Widget.Button({
                label: 'Cancel',
                on_clicked: (s) => s.parent.destroy() 
            }),
            Widget.Button({
                label: 'Confirm',
                on_clicked: () => Utils.exec(operation)
            })
        ]
    })
}

export default Power_Warning;
