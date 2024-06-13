const player = await Service.import('mpris')

player.connect('changed', function(s){
    now_playing.set_label(s.players[0].track_title)
})

const now_playing = Widget.Label({
        label: "Nothings playing"
})


const Player = Widget.Box({
    children: [
        now_playing
    ]
})

export default Player;
