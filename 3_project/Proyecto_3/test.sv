class test extends uvm_test;
    `uvm_component_utils(test); // Register at the factory

    function new(string name = "test", uvm_component parent=null); // Builder
        super.new(name,parent);
    endfunction

    ambiente amb_inst;
    my_sequence	seq;

    virtual bus_mesh_if  vif;
////////////////////////////////////////////////////////////////////////////////////////////////
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        amb_inst = ambiente::type_id::create("amb_inst",this);

        //Verifica si se conecto correctamente al interface
        if(!uvm_config_db#(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif))
            `uvm_fatal("Test","Could not get vif")
            uvm_config_db#(virtual bus_mesh_if)::set(this,"amb_inst.agent.*","bus_mesh_if",vif);
        //Genera la secuencia 
        seq = my_sequence::type_id::create("seq");
        seq.randomize() with {trans_num inside{[30:40]};};
    endfunction
////////////////////////////////////////////////////////////////////////////////////////////////
    virtual task run_phase(uvm_phase phase);
        //report();
        phase.raise_objection(this);
      	seq.start(amb_inst.agent_inst.seq_inst);
        phase.drop_objection(this);
    endtask
endclass

    // One specific test, used for test values and debug
class test_debug extends test;
    `uvm_component_utils(test_debug); // Register at the factory

    function new(string name = "test_debug", uvm_component parent=null); // Builder
        super.new(name,parent);
    endfunction


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      seq.randomize() with {trans_num inside{[1:2]};};
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
      	seq.start(amb_inst.agent_inst.seq_inst);
        phase.drop_objection(this);
    endtask
endclass

