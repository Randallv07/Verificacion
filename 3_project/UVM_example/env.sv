class my_env extends uvm_env

    `uvm_component_utils (my_env)

    agent my_agent;
    scoreboard my_scoreboard;
 


    function new (string name = "my_env", uvm_component parent = null);
        super.new (name, parent)
    endfunction
    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        my_agent=agent::type_id::create("my_agent", this);
        my_scoreboard=scoreboard::type_id::create("my_scoreboard", this);
    virtual function void connect_phase (uvm_phase phase);
        //super.connect_phase(phase)
        my_agent.my_monitor.item_collected_port.connect(my_scoreboard.data_export);
    endfunction
endclass




