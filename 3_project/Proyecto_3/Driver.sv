class driver extends uvm_driver #(item);
`uvm_component_utils(driver)
parameter int  pckg_sz = 40;

//Constructor 
function new(string name = "driver", uvm_phase parent = null);
    super.new(name,parent);
endfunction 

    bit [pckg_sz-1:0] FIFO_IN[$]; //Queue llamada FIFO_IN
    int id_fifo;

    function new (int ID); //id_fifo identifica el numero de fifo correspondiente a la instancia
	    FIFO_IN = {}; //Inicializa la Queue vacia 
	    this.id_fifo = ID; //Asigna un numero a la variable id_fifo, segun el numero de iteraciones que se haga en el testbench		
    endfunction


    function Fin_push(bit [pckg_sz-1:0] dato); // Push de la FIFO in
		this.FIFO_IN.push_back(dato);
		this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0];
		this.vif.pndng_i_in[this.id_fifo] = 1;
    endfunction

    task interfaz();
        this.vif.pndng_i_in[this.id_fifo] = 0;
        forever begin
            if(this.FIFO_IN.size==0) begin 
                this.vif.pndng_i_in[this.id_fifo] = 0;
                this.vif.data_out_i_in[this.id_fifo] = 0;
            end
            else begin
                this.vif.pndng_i_in[this.id_fifo] = 1;
                this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0];
            end
            @(posedge this.vif.popin[this.id_fifo]);
	  if(this.FIFO_IN.size>0) begin this.FIFO_IN.delete(0);
	
	  //assersion fifo in
		assert(this.vif.popin[this.id_fifo])begin // ve si el dut esta haciendo popin para capturar dato.
		  //$display("[PASS] DUT captura datos##########################################################################################################################3");
		end
		else begin
		  $error("########################################################DUT no capturo datos##########################################################################################################");
		end
  end
	end

endtask

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
    this.Fin_push(dato);
    this.Interfaz();

forever begin
    item s_item;
    `uvm_info("Driver", $formatf("Esperando por item de secuencia"),UVM_HIGH)
    seq_item_port.get_next_item(s_item);
    driver_item(s_item);
    seq_item_port.item_done(s_item);

    //Realizar operaciones con la FIFO
    /*fifo_inst.Fin_push();

    fork
        fifo_inst.interfaz();
    join_none */



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