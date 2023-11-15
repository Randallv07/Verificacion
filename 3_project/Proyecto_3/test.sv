class test extends uvm_test;
    `uvm_component_utils(test); // Register at the factory

    function new(string name = "test", uvm_component parent=null); // Builder
        super.new(name,parent);
    endfunction


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        amb_inst = ambiente::type_id::create("amb_inst",this);

        //Verifica si se conecto correctamente al interface
        if(!uvm_config_db#(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif))
            `uvm_fatal("Test","No se conecto al vif")
        uvm_config_db#(virtual bus_mesh_if)::set(this,"amb_inst.agn_inst.*","bus_mesh_if",vif);
    endfunction
    
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        #10;
        uvm_warning("","Inicio del Test!")
        phase.drop_objection(this);
    endtask
endclass



