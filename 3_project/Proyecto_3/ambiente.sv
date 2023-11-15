class ambiente extends uvm_env;
    `uvm_component_utils(ambiente)

    agent agent_inst_amb [15:0];
    scoreboard scoreboard_inst_amb;
    uvm_analysis_port #(string) port_score //No se para que es

     function new(string name="ambiente", uvm_component parent=null); 
        super.new(name, parent);
    endfunction

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        //Crea las instancias del agente, el agente contiene al sequencer, driver y monitor
        for (int i=0; i<16; i++) begin
            automatic int k=i;
            agent_inst_amb[k] = agent::type_id::create($formatf("Agente # %0d",k),this);
        end

        scoreboard_inst_amb = scoreboard::type_id::create("Scoreboard",this);
        port_score = new("Conexion Monitor-Scoreboard",null);
        port_score.connect(scoreboard_inst_amb.conec);
        port_score.resolve_bindings();
    endfunction

    virtual function void connect_phase(uvm_phase phase); 
        super.connect_phase(phase);
        for (int i=0; i<16; i++)begin
            automatic k =i;
            agent_inst_amb[k].mnt_inst.conec_mon.connect(scoreboard_inst_amb.conec);
            agent_inst_amb[k].drv_inst.id_driver = k;
            agent_inst_amb[k].mnt_inst.id_monitor = k;
        end
    endfunction

endclass