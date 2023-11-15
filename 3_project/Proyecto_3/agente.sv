class agent extends uvm_agent;
	`uvm_component_utils(agent); // Register at the factory

  	driver drv_inst;	// Instancia del driver
	monitor mnt_inst;	// Instancia del monitor
  	uvm_sequencer #(item)   seq_inst; //Instancia del sequencer

	function new(string name = "agent", uvm_component parent=null); // Builder
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drv_inst = driver::type_id::create ("Driver",this);
		mnt_inst = monitor::type_id::create("Monitor",this);
		seq_inst = uvm_sequencer#(item)::type_id::create("Sequencer",this);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
      	drv_inst.s_item_port.connect(seq_inst.s_item_port);
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		begin
			my_sequence transaccion;
			transaccion = my_sequence::type_id::create("trans");

			repeat(2) begin
				transaccion.start(seq_inst);
			end
		end
		phase.drop_objection(this);
	endtask
endclass

