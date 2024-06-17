import GLib from 'gi://GLib';
import Gio from 'gi://Gio';

class WorkspaceService extends Service {
    static {
        Service.register(
            this,
            { //Signals
                'workspace-changed' : ['string'],
                'workspace-data-changed' : ['jsobject']
            },
            { //Properties
                'workspace-active' : ['string', 'r'],
                'workspace-data' : ['jsobject', 'r']
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
    #workspace_data = {};

    #old_output = "";

    get workspace_active(){
        return this.#workspace_active;
    }

    get workspace_data(){
        return this.#workspace_data; 
    }

    constructor() {
        super();

        //Monitor
        Utils.interval(250, () => this.#updateWorkspace())
    }

    #updateWorkspace() { //TODO: Change to IPC
        const output_raw = Utils.exec("swaymsg -t get_workspaces -r")
        if(output_raw != this.#old_output){
            this.#old_output = output_raw


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
            this.#workspace_data = y
            this.emit('changed')
            this.notify('workspace-data')
            this.emit('workspace-data-changed', this.#workspace_data)
        }
    }

    connect(event = 'workspace-changed', callback) {
        return super.connect(event, callback);
    }
}

const service = new WorkspaceService;

export default service;
