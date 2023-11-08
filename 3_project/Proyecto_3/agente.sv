class agent extends uvm_agent;
	`uvm_component_utils(agent); // Register at the factory
	parameter int  ROWS = 4;
	parameter int  COLUMS = 4;
	parameter int  pckg_sz = 40;
	parameter int  fifo_depth = 4;
	parameter int drvrs = [ROWS*2 + COLUMS*2];

	function new(string name = "agent", uvm_component parent=null); // Builder
		super.new(name,parent);
	endfunction

	driver	      	 	    drv_inst;	// Instancia del driver
	monitor 	            mnt_inst;	// Instancia del monitor
	uvm_sequencer #(item)   sequencer_inst //Instancia del sequencer
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		// Generando instancias de los drivers
		for (int i = 0; i < drvrs ; i++) begin
    		string name = $sformatf("drv%d", i);
    		drv_inst = driver::type_id::create(name, null);
		end

		//Generando instancias de los monitores
		for (int j = 0; j < drvrs; j++) begin
			string name2 = $sformatf("mnt%d", j);
    		mnt_inst = monitor::type_id::create(name2, null);
		end


	endfunction
	
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv_inst.seq_item_port.connect(sequencer_inst.seq_item_export);
	endfunction
endclass
