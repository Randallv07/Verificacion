class driver extends uvm_driver #(item);
`uvm_component_utils(driver)

//Constructor 
function new(string name = "driver", uvm_phase parent = null);
    super.new(name,parent);
endfunction 


//Llamando a la interfaz de del DUT

virtual bus_mesh_if  vif;

virtual function void  build_phase(uvm_phase phase); //Se conecta el bus_mesh_if con vif para la interfaz virtual.
    super.build_phase(phase);
    if (!uvm_config_db #(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif)) //uvm_config_db es una clase de utlidades para almacenar y recibir info entre componentes
        `uvm_fatal("Interfaz virtual", "No se pudo conectar vif")              //uvm_config_db es usada para recuperar la interfaz virtual a partir del agente
endfunction


virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

//Declarando la instancia de la FIFO
    fifo_in fifo_in_inst;

forever begin
    item s_item;
    `uvm_info("Driver", $formatf("Esperando por item de secuencia"),UVM_HIGH)
    seq_item_port.get_next_item(s_item);
    driver_item(s_item);
    seq_item_port.item_done(s_item);

    //Realizar operaciones con la FIFO
    fifo_inst.Fin_push();

    fork
        fifo_inst.interfaz();
    join_none



   /* virtual task driver_item(s_item)
    @(posedge vif.clk);
    begin

        vif.pndng <= 
        vif.data_out <=
        vif.popin <=
        vif.pop <=
        vif.data_out_i_in <=
        vif.pndng_i_in <=
        vif.reset <= */ 

end
endtask 

endclass