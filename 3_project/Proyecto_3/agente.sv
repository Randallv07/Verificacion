class agent extends uvm_agent;
	`uvm_component_utils(agent); // Register at the factory

	function new(string name = "agent", uvm_component parent=null); // Builder
		super.new(name,parent);
	endfunction

  	driver	      	 	    drv_inst[15:0];	// Instancia del driver
	monitor 	            mnt_inst[15:0];	// Instancia del monitor
  	uvm_sequencer #(item)   seq_inst; //Instancia del sequencer
  
  ////////////////////////////////////////////////////////////////////////////
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
      	for (int i=0; i<16 ; i++ ) begin
      		automatic int a=i;
      		drv_inst[a] = driver::type_id::create($sformatf("drv_inst%0d",a),this);  
          	mnt_inst[a] = monitor::type_id::create($sformatf("mnt_inst%0d",a),this);  
    	end
      	seq_inst = uvm_sequencer#(item)::type_id::create("sequencer", this);
	endfunction

  ///////////////////////////////////////////////////////////////////////////////
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
      	for (int i=0; i<16 ; i++ ) begin
        	automatic int a=i;
          	drv_inst[a].id_driver=a;// para que cada driver sepa que numero es
          	mnt_inst[a].id_monitor=a;// para que cada monitor sepa que numero
          	drv_inst[a].seq_item_port.connect(seq_inst.seq_item_export);
        end
	endfunction
endclass
