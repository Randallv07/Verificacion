class my_driver extends uvm_driver #(Item);

    `uvm_component_utils (my_driver)

    function new (string name = "my_driver", uvm_component parent = null);
        super.new (name, parent);
    endfunction


    virtual  des_if  vif;

    virtual function void build_phase(uvm_phase phase);
    super.bulid_phase(phase);

    if (!uvm_config_db #(virtual des_if) ::get(this, "","des_vif",vif))
        `uvm_fatal("DRV","No pudo obtenerse vif")
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            Item m_item;
            `uvm_info("DRV",$sformatf("Espera por el item de la secuencia"),UVM_HIGH);
            seq_item_port.get_next_item(m_item);
            drive_item(m_item);
            seq_item_port.item_done();
        end
    endtask  

    virtual task drive_item(Item m_item);
    @(vif.cb);
    vif.cb.in <= m_item.in;
    endtask
endclass