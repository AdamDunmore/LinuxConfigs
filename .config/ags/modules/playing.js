const player = await Service.import('mpris')

player.connect('changed', function(s){
    now_playing_title.set_label(s.players[0].track_title)
    now_playing_artist.set_label(s.players[0].track_artists[0])
    now_playing_cover.setCss(`background-image: url('${s.players[0].track_cover_url}')`)
})

const now_playing_title = Widget.Label({
        label: "Nothings playing",
        className: "now_playing_info_title",
})


const now_playing_artist = Widget.Label({
        label: "",
        className: "now_playing_info_artist",
})

const now_playing_cover = Widget.Box({
    className: "now_playing_cover"
})

const Player = Widget.Box({
    className: "now_playing_container",
    children: [
        now_playing_cover,
        Widget.Box({
            className: "now_playing_info",
            vpack: "center",
            orientation: 1,
            children: [
                now_playing_title,
                now_playing_artist,
            ]
        })

    ]
})

export default Player;
