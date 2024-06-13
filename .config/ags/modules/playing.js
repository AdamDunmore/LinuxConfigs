const player = await Service.import('mpris')

function checkPlayer(s){
    if (s.players[0] == undefined){
        now_playing_title.set_label("Nothings playing");
        now_playing_artist.set_label("");
        now_playing_cover.hide()
    }
    else{
        now_playing_title.set_label(s.players[0].track_title)
        now_playing_artist.set_label(s.players[0].track_artists[0])
        if (s.players[0].track_cover_url == ""){
            now_playing_cover.hide()
        }
        else{
            now_playing_cover.show()
            now_playing_cover.setCss(`background-image: url('${s.players[0].track_cover_url}')`)
        }
    }
}

player.connect('changed', function(s){
    checkPlayer(s)
})

const now_playing_title = Widget.Label({
        label: "",
        className: "now_playing_info_title",
        wrap: true
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

checkPlayer(player)

export default Player;
