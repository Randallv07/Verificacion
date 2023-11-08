

class monitor extends uvm_monitor;
	`uvm_component_utils(monitor); // Registro en la fabrica

	function new(string name = "monitor", uvm_component parent=null); // Constructor
		super.new(name,parent);
	endfunction
	
	virtual bus_mesh_if vif; // Interface virtual para el DUT
	uvm_analysis_port #(item) mon_analysis_port; // Puntero para el analisis de puerto para el item en el monitor

	virtual function void build_phase(uvm_phase phase); // Fase de construcción
		super.build_phase(phase);
		if (!uvm_config_db #(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif))
			`uvm_fatal("Monitor","Could not get vif")
		mon_analysis_port = new("mon_analysis_port",this); // Crea el puerto con el puntero
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		 forever @(negedge vif.clk)begin 
			item item_mon = item::type_id::create("item_mon"); // Nuevo puntero item_mon de tipo item
			item_mon.salida = vif.data_out;  // Gets the value "r" from the interface			
			`uvm_info("Monitor",$sformatf("Item %s",item_mon.print_salida()),UVM_HIGH)
			mon_analysis_port.write(item_mon);
		end
	endtask
endclass
