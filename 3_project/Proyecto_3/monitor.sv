<<<<<<< HEAD


class monitor extends uvm_monitor;
	`uvm_component_utils(monitor); // Registro en la fabrica

	function new(string name = "monitor", uvm_component parent=null); // Constructor
		super.new(name,parent);
	endfunction
=======
//`uvm_analysis_port_decl(_p_mntr)

class monitor extends uvm_monitor #(item);
  `uvm_component_utils(monitor); // Registro en la fabrica
  
  function new(string name = "monitor", uvm_component parent=null); // Constructor
    super.new(name,parent);
  endfunction
  
  parameter int pckg_sz = 40;
>>>>>>> Emanuel
  
  int id_monitor;
  int count = 0;
  virtual bus_mesh_if vif;
	
<<<<<<< HEAD
	uvm_analysis_port #(item) mon_analysis_port; // Puntero para el analisis de puerto para el item en el monitor
=======
  uvm_analysis_port #(item) mon_analysis_port; 
>>>>>>> Emanuel

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
	virtual function void build_phase(uvm_phase phase); // Fase de construcción
		super.build_phase(phase);
		if (!uvm_config_db #(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif))
			`uvm_fatal("Monitor","Could not get vif")
<<<<<<< HEAD
		mon_analysis_port = new("mon_analysis_port",this); // Crea el puerto con el puntero
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
      vif.pop[id_monitor]=0;
      phase.raise_objection(this);//esto para ejecutar
      begin 
        `uvm_warning("Se inicializó el monitor", get_type_name())
        
        forever begin
      		vif.pop[id_monitor]=0;
          if (vif.pndng[id_monitor]==1) begin
            //`uvm_info("Monitor",$sformatf("Item %s",item_mon.print_salida()),UVM_HIGH);
            $display("El monitor %d recibe el mensaje: %b ", id_monitor, vif.data_out[id_monitor]);
            vif.pop[id_monitor]=1;
          end
          @(posedge vif.clk);
          if (count > 150) begin
            break;
          end
          count++;
      	  @(posedge vif.clk);
        end
      end
	endtask
=======
			mon_analysis_port = new("mon_analysis_port",this); // Crea el puerto con el puntero
		endfunction

		virtual task run_phase(uvm_phase phase);
          super.run_phase(phase);
          vif.pop[id_monitor]=0;
          phase.raise_objection(this);//esto para ejecutar
          begin 
          `uvm_warning("Se inicializó el monitor", get_type_name())

          	forever begin
              item s_item = item::type_id::create("s_item");
              	vif.pop[id_monitor]=0;
              if (vif.pndng[id_monitor]==1) begin
                s_item.out = vif.data_out[id_monitor];
                mon_analysis_port.write(s_item);
                  //`uvm_info("Monitor",$sformatf("Monitor #%0d: %s", id_monitor, s_item.print_salida()), UVM_MEDIUM);
                //mon_analysis_port.write(s_item);
                `uvm_info("MONITOR", $sformatf("El monitor #%0d destino: [%0d][%0d] recibe dato: %h de driver fuente [%0d][%0d] en modo %0b", id_monitor, vif.data_out[id_monitor][pckg_sz-9:pckg_sz-12], vif.data_out[id_monitor][pckg_sz-13:pckg_sz-16], vif.data_out[id_monitor][pckg_sz-26:0], vif.data_out[id_monitor][pckg_sz-18:pckg_sz-21], vif.data_out[id_monitor][pckg_sz-22:pckg_sz-25], vif.data_out[id_monitor][pckg_sz-17]), UVM_LOW);  
                 vif.pop[id_monitor]=1;
   
              	end
              @(posedge vif.clk);
              if (count > 150) begin
                break;
              end
              count++;
              @(posedge vif.clk);
              mon_analysis_port.write(s_item);
              end
        	end
      	endtask
>>>>>>> Emanuel
endclass

