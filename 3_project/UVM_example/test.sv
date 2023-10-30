class my_test extend uvm_test;
  
    `uvm_components_utils (my_test)
  
    function new (string name = "my_test", uvm_componet parent = null);
        super.new (name, parent)
    endfunction

    my_env m_top_env;
    my_cfg my_cfg0;

    virtual function void (uvm_phase phase);
        super.build_phase (phase);

        m_top_env = my_env::type_id::create ("m_top_env", this);
        my_cfg0 = my_cfg::type_id::create ("m_cfg0", this);

        set_cfg_params ();

        uvm_config_db #(my_cfg) :: set (this, "m_top_env.my_agent", "m_cfg0", m_cfg0);
    endfunction

    virtual function void set_cfg_params ();

        if (! uvm_componet #(virtual dut_if) :: get (this, "", "dut_if", m_cfg0.vif))begin
            `uvm_error (get_type_name (), "DUT Interface not found !")
        end

        m_cfg0.m_verbosity = UVM_HIGH;
        m_cfg0.active = UVM_ACTIVE;
    endfunction

    function void end_of_simulation_phase (uvm_phase phase);
        uvm_top.print_topology ();    
    endfunction

    function void start_of_simulation_phase (uvm_phase phase);
        super.start_of_simulation_phase (phase);
        uvm_config_db#(uvm_object_wrapper)::set(this, "m_top_env.my_agent.m_seqr0.main_phase","default_sequence", base_sequence::type_id::get());
    endfunction
    
    virtual task run_phase (uvm_phase phase);
        my_seq m_seq = my_seq::type_id::create ("m_seq");

        super.run_phase(phase);
        phase.raise_objection (this);
        m_seq.start (m_env.seqr);
        phase.drop_objection (this);
    endtask

endclass
