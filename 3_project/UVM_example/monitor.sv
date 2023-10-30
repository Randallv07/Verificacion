class my_monitor extends uvm_monitor;
    `uvm_component_utils (my_monitor)

    virtual dut_if vif;
    bit eneable_check = 1;

    uvm_analysis_port #(my_data) mon_analysis_port;

    function new (string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase (uvm_phase phase);
        super.build_phase (phase);

        mon_analysis_port = new ("mon_analysis_port", this);
        if (! uvm_config_db #(virtual dut_if):: get (this, "","vif", vif)) begin
            `uvm_error (get_type_name(), "DUT interface not found")
        end
    endfunction
endclass