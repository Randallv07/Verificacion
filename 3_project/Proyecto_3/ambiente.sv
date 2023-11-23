class ambiente extends uvm_env;
    `uvm_component_utils(ambiente) //Registro en fabrica

    function new(string name="ambiente", uvm_component parent=null);  // constructor
        super.new(name, parent);
    endfunction
    // instancias
  	agent#(item) agent_inst;
    scoreboard#(item) scoreboard_inst;

    virtual function void build_phase (uvm_phase phase); //fase de construccion
        super.build_phase(phase);
      	agent_inst = agent::type_id::create($sformatf("agent"),this);
        scoreboard_inst = scoreboard::type_id::create("scoreboard_inst", this);
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);  // fase de conexion
        super.connect_phase(phase);
      for (int i=0; i<16 ; i++ ) begin
      		automatic int a=i; //conexion de puertos
      		agent_inst.mnt_inst[a].mon_analysis_port.connect(scoreboard_inst.m_analysis_imp);
        	agent_inst.drv_inst[a].drv_analysis_port.connect(scoreboard_inst.d_analysis_imp);
      end
    endfunction
    

endclass