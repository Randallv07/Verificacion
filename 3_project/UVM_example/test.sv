class my_test extend uvm_test;
  
    `uvm_components_utils (my_test)
  
    function new (string name = "my_test", uvm_componet parent = null);
        super.new (name, parent);
    endfunction

    env e0;
    bit[`LENGTH-1:0] pattern = 4'b1011;
    get_item_seq seq;
    virtual des_if vif;


    virtual function void build_phase (uvm_phase phase);
        super.build_phase (phase);

        e0 = env::type_id::create ("e0", this);
        

        if (!uvm_config_db #(virtual des_if)::set(this, "", "des_vif",vif))
            `uvm_fatal("TEST","Did not get vif");
        uvm_config_db #(virtual des_if)::set(this, "e0.a0.*","des_vif",vif);
        uvm_config_db #(bit [`LENGTH-1:0])::set(this,"*","ref_pattern",pattern);
        seq = gen_item_seq::type_id::create("seq");
        seq.randomize();
    endfunction

    virtual task run_phase (uvm_phase phase);
        phase.raise_objection(this);
        apply_reset();
        seq.start(e0.a0.s0);
        #200;
        phase.drop_objection(this);
    endtask

    virtual task apply_reset();
        vif.rstn <= 0;
        vif.in <= 0;
        repeat(5) @ (posedge vif.clk);
        vif.rstn <= 1;
        repeat(10) @ (posedge vif.clk);
    endtask
endclass

 class test_1011 extends base_test;

    `uvm_component_utils(test_1011);
    function new (string name = "test_1011", uvm_component parent = null);
        super.new(name,parent);
    endfunction  


    virtual function void build_phase(uvm_phase phase);
        pattern = 4'b1011;
        super.build_phase(phase);
        seq.randomize() with {num inside {[300:500]};};
    endfunction    

endclass
