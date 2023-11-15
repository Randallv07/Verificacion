class driver extends uvm_driver #(item);
`uvm_component_utils(driver)

    function new(string name = "driver", uvm_component parent = null); //Constructor 
        super.new(name,parent);
    endfunction 


    //Llamando a la interfaz del DUT
    virtual bus_mesh_if  vif;

    int id_driver;
    function void  build_phase(uvm_phase phase); //Se conecta el bus_mesh_if con vif para la interfaz virtual.
        super.build_phase(phase);
        if (!uvm_config_db #(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif)) //uvm_config_db es una clase de utlidades para almacenar y recibir info entre componentes
            `uvm_fatal("Interfaz virtual", "No se pudo conectar vif")              //uvm_config_db es usada para recuperar la interfaz virtual a partir del agente
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);

        vif.reset = 1;

        @(posedge vif.clk);
        #1;
        vif.reset = 0;
   
    forever begin
        `uvm_info("FIFO IN", $sformatf("Esperando por item de secuencia"),UVM_HIGH)
        seq_item_port.get_next_item(seq_item);
        //driver_item(seq_item);
        //seq_item_port.item_done(seq_item);
        @(posedge vif.clk);begin
            this.vif.data_out_i_in[id_driver] = 0;
            this.vif.pndng_i_in[id_driver] = 0;
        end
        @(posedge vif.clk);begin
            this.vif.data_out_i_in[id_driver] = {seq_item.Next_jump, seq_item.d_fila, seq_item.d_columna, seq_item.modo, seq_item.f_fila, seq_item.f_columna, seq_item.dato};
            this.vif.pndng_i_in[id_driver] = 1;
        end
        @(posedge vif.clk);
            wait(vif.popin[id_driver]); 
        
        $display("Driver #[%0d] el mensaje %0d", id_driver, {seq_item.Next_jump, seq_item.d_fila, seq_item.d_columna, seq_item.modo, seq_item.f_fila, seq_item.f_columna, seq_item.dato});
        seq_item_port.item_done();
    end   
    endtask

endclass