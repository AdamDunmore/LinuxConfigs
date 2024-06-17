import GLib from 'gi://GLib';
import Gio from 'gi://Gio';

class WorkspaceService extends Service {
    static {
        Service.register(
            this,
            { //Signals
                'workspace-changed' : ['string']
            },
            { //Properties
                'workspace-active' : ['string', 'r']
            }
        );
    }
    
    #connect_to_ipc() {
        const sock = GLib.getenv("SWAYSOCK") || "";
        const path = GLib.file_test(sock, GLib.FileTest.EXISTS) //Fix this 
            ? sock
            : sock

        const connection = new Gio.SocketClient()
            .connect(new Gio.UnixSocketAddress({ path: path }), null);

        const message = JSON.stringify({
            "command": "subscribe",
            "payload": ["workspace"]
        })

        const istream = connection.get_input_stream()
        const ostream = connection.get_output_stream()

        ostream.write_all(new TextEncoder().encode(message), null)
    
    }

    #workspace_active = "0";

    get workspace_active(){
        return this.#workspace_active;
    }

    constructor() {
        super();

        //Monitor
        Utils.interval(500, () => this.#updateWorkspace())
    }

    #updateWorkspace() { //TODO: Change to IPC
        const output_raw = Utils.exec("swaymsg -t get_workspaces -r")
        const y = JSON.parse(output_raw)
        let active = "0"

        //Find active workspace
        for (let x = 0; x < y.length; x++){
            if (y[x]["focused"] == true){
                active = y[x]
                break
            }
        }

        this.#workspace_active = active["name"]
        this.emit('changed')
        this.notify('workspace-active')
        this.emit('workspace-changed', this.#workspace_active)
    }

    connect(event = 'workspace-changed', callback) {
        return super.connect(event, callback);
    }
}

const service = new WorkspaceService;

export default service;
