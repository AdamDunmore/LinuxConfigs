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
    
    #workspace_active = "0";
    #workspace_data = {};

    #old_output = "";
    #wm = "";

    get workspace_active(){
        return this.#workspace_active;
    }

    get workspace_data(){
        return this.#workspace_data; 
    }

    constructor() {
        super();
        
        this.#wm = Utils.exec(`${Utils.HOME}/.config/ags/scripts/getwm.sh`)

        //Monitor
        Utils.interval(150, () => this.#updateWorkspace())
    }

    #updateWorkspace() {
        let active;
        let data;
        switch(this.#wm){
            // case "river":
            //     break;
            case "sway":
                const output_raw = Utils.exec("swaymsg -t get_workspaces -r")
                if(output_raw != this.#old_output){
                    this.#old_output = output_raw
                
                    data = JSON.parse(output_raw) 
                    //Find active workspace
                    for (let x = 0; x < data.length; x++){
                        if (data[x]["focused"] == true){
                            active = data[x]["name"]
                            x = data.length;
                        }
                    }

                    this.#workspace_active = active
                    this.#workspace_data = data
                }
                break;

            default:
                active = "Error"
                data = {}
                break;
                
        }
        
        this.emit('changed')
        this.notify('workspace-data')
        this.emit('workspace-data-changed', this.#workspace_data)
    }

    connect(event = 'workspace-changed', callback){
        return super.connect(event, callback);
    }
}

const service = new WorkspaceService;

export default service;
