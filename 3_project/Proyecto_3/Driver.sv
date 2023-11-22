//`uvm_analysis_port_decl(_p_drvr)
class driver extends uvm_driver #(item);
  
  `uvm_component_utils(driver)
  
  function new(string name = "driver", uvm_component parent = null); //Constructor 
    super.new(name, parent);
  endfunction 

  virtual bus_mesh_if vif; //interfaz virtual
  int id_driver; 
  bit [3:0] f_fila;
  bit [3:0] f_columna;
  int count = 0;
  
  int espera =0;
  parameter pckg_sz =40;
  
  uvm_analysis_port #(item) drv_analysis_port; // Puntero para el analisis de puerto para el item en el monitor

  /////////////////////////////////////////////////////////


  
   //fase de construccion
    virtual function void  build_phase(uvm_phase phase); //Se conecta el bus_mesh_if con vif para la interfaz virtual.
        super.build_phase(phase);
        if (!uvm_config_db #(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif)) //uvm_config_db es una clase de utlidades para almacenar y recibir info entre componentes
            `uvm_fatal("Interfaz virtual", "No se pudo conectar vif")              //uvm_config_db es usada para recuperar la interfaz virtual a partir del agente
          drv_analysis_port = new("drv_analysis_port",this); // Crea el puerto con el puntero
    endfunction
          
////////////////////////////////////////////////////////////

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        vif.reset = 1;
        vif.data_out_i_in[id_driver] = 0; // Ingresa un dato 0 a los diferentes terminales
        vif.pndng_i_in[id_driver] = 0; //Asigna el pending  de entrada =1  a las terminales
        @(posedge vif.clk);
        #1;
        vif.reset = 0;
        
        forever begin
          //`uvm_info("DRV", $formatf("Esperando por item de secuencia"), UVM_HIGH);
          item s_item = item::type_id::create("s_item");
          seq_item_port.get_next_item(s_item);
          @(posedge vif.clk);
            vif.data_out_i_in[id_driver] = 0;
            vif.pndng_i_in[id_driver] = 0;
          @(posedge vif.clk);
          @(posedge vif.clk);
          s_item.f_fila = f_fila;
          s_item.f_columna = f_columna;
          vif.data_out_i_in[id_driver] = {s_item.Next_jump, s_item.d_fila, s_item.d_columna, s_item.modo, f_fila, f_columna, s_item.dato}; //Podria agregarse la filas y columnas de origen para mostrarlas
            vif.pndng_i_in[id_driver] = 1;
          @(posedge vif.clk);
            wait (vif.popin[id_driver]);
          /////////////////////////////////
          	vif.pndng_i_in[id_driver] = 0;
          	while (espera < s_item.retardo)begin
            @(posedge vif.clk);
          	espera = espera +1;
          	end
          ////////////////////////////////
            //vif.pndng_i_in[id_driver] = 0;
            seq_item_port.item_done();
          //`uvm_info("DRV", $sformatf("Driver #%0d: %s", id_driver, s_item.print_transaccion()), UVM_MEDIUM);
          //$display("El driver #%0d fuente: [%0d][%0d], envia el mensaje: %0h al driver destino [%0d][%0d], en modo %0d", id_driver, f_fila, f_columna, s_item.dato, s_item.d_fila, s_item.d_columna, s_item.modo);
          //$display("El driver #%0d envia a fila: %0d, columna: %0d ", id_driver, s_item.d_fila, s_item.d_columna);
          //$display("El driver #%0d envia a next_jmp: %0d, %0d", id_driver, f_fila, f_columna);
          //$display("El driver #%0d tiene fila: [%b], columna: [%b]", f_fila, f_columna);
          `uvm_info("DRIVER", $sformatf("El driver #[%0d] envía desde la fuente [%0d][%0d] el mensaje: %h hacia el destino [%0d][%0d] en modo [%d], con un valor de retardo [%0d]", id_driver, f_fila, f_columna, vif.data_out_i_in[id_driver][pckg_sz-25:0], s_item.d_fila, s_item.d_columna, s_item.modo, s_item.retardo), UVM_LOW);
          
          
          @(posedge vif.clk);
          if (count > 150) begin
                break;
              end
              count++;
          @(posedge vif.clk);
          drv_analysis_port.write(s_item);
          
        end   
    endtask 
endclass
      