class ambiente extends uvm_env;
    `uvm_component_utils(ambiente)

    function new(string name="ambiente", uvm_component parent=null); 
        super.new(name, parent);
    endfunction

<<<<<<< HEAD
  	agent agent_inst;
    //scoreboard scoreboard_inst;
=======
  	agent#(item) agent_inst;
    scoreboard#(item) scoreboard_inst;
>>>>>>> Emanuel

	//////////////////////////////////////////////////////////////////
    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
<<<<<<< HEAD
      		agent_inst = agent::type_id::create($sformatf("agent"),this);
        //scoreboard_inst = scoreboard::type_id::create("scoreboard_inst", this);
=======
      	agent_inst = agent::type_id::create($sformatf("agent"),this);
        scoreboard_inst = scoreboard::type_id::create("scoreboard_inst", this);
>>>>>>> Emanuel
    endfunction
    
    virtual function void connect_phase(uvm_phase phase); 
        super.connect_phase(phase);
<<<<<<< HEAD
		//agent_inst.scoreboard_inst.mon_analysis_port.connect(sb0.m_analysis_imp);
=======
      for (int i=0; i<16 ; i++ ) begin
      		automatic int a=i;
      		agent_inst.mnt_inst[a].mon_analysis_port.connect(scoreboard_inst.m_analysis_imp);
        	agent_inst.drv_inst[a].drv_analysis_port.connect(scoreboard_inst.d_analysis_imp);
      end
>>>>>>> Emanuel
    endfunction
    

endclass