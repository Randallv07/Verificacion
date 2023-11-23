class test extends uvm_test;
    `uvm_component_utils(test); // Register at the factory
  


    function new(string name = "test", uvm_component parent=null); // Builder
        super.new(name,parent);
    endfunction

    ambiente amb_inst;
    my_sequence	seq;
  	MODE0 MODE0_test;
	MODE1 MODE1_test;
  	MODE_RETARDO RETARDO_test;
  	UNO_A_TODOS UNO_A_TODOS_test;
  	TODOS_A_UNO TODOS_A_UNO_test;
  	DESTINO_INVALIDO DESTINO_INVALIDO_test;

    virtual bus_mesh_if  vif;
////////////////////////////////////////////////////////////////////////////////////////////////
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        amb_inst = ambiente::type_id::create("amb_inst",this);
        //Verifica si se conecto correctamente al interface
        if(!uvm_config_db#(virtual bus_mesh_if)::get(this,"","bus_mesh_if",vif))
            `uvm_fatal("Test","Could not get vif")
            uvm_config_db#(virtual bus_mesh_if)::set(this,"amb_inst.agent.*","bus_mesh_if",vif);
        //Genera la secuencia 
        seq = my_sequence::type_id::create("seq");
      	MODE0_test = MODE0::type_id::create("MODE0_test");
      	MODE1_test = MODE1::type_id::create("MODE1_test");
      	RETARDO_test = MODE_RETARDO::type_id::create("RETARDO_test");
      	UNO_A_TODOS_test = UNO_A_TODOS::type_id::create("UNO_A_TODOS_test"); 
      	TODOS_A_UNO_test = TODOS_A_UNO::type_id::create("TODOS_A_UNO_test");
      	DESTINO_INVALIDO_test = DESTINO_INVALIDO::type_id::create("DESTINO_INVALIDO_test");
      	seq.randomize() with {trans_num inside{[1:2]};};
    endfunction
////////////////////////////////////////////////////////////////////////////////////////////////
    virtual task run_phase(uvm_phase phase);
        //report();
        phase.raise_objection(this);
      for (int i=0; i<16 ; i++ ) begin
      	automatic int a=i;
        seq.start(amb_inst.agent_inst.seq_inst[a]);
        MODE0_test.start(amb_inst.agent_inst.seq_inst[a]);
        MODE1_test.start(amb_inst.agent_inst.seq_inst[a]);
        RETARDO_test.start(amb_inst.agent_inst.seq_inst[a]);
        UNO_A_TODOS_test.start(amb_inst.agent_inst.seq_inst[a]);
        TODOS_A_UNO_test.start(amb_inst.agent_inst.seq_inst[a]);
        DESTINO_INVALIDO_test.start(amb_inst.agent_inst.seq_inst[a]);
      end
        phase.drop_objection(this);
    endtask
endclass

    // One specific test, used for test values and debug
class test_debug extends test;
    `uvm_component_utils(test_debug); // Register at the factory

    function new(string name = "test_debug", uvm_component parent=null); // Builder
        super.new(name,parent);
    endfunction


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      seq.randomize() with {trans_num inside{[1:2]};};
    endfunction
/*
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
      for (int i=0; i<16 ; i++ ) begin
        automatic int a=i;
      		seq.start(amb_inst.agent_inst.seq_inst[a]);
      	end
        phase.drop_objection(this);
    endtask*/
  
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);

      for (int i = 0; i < 100; i++) begin
            automatic int a;
            a = $urandom_range(0, 15);

            // Iniciar la transacción
            seq.start(amb_inst.agent_inst.seq_inst[a]);

            // Esperar un tiempo entre transacciones
          #20;
        end
		#10000;
      	$finish;
        phase.drop_objection(this);
      //end
    endtask
endclass

class test_MODE0 extends test;
  `uvm_component_utils(test_MODE0); // Register at the factory
  function new(string name = "test_MODE0", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    MODE0_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO 0");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = $urandom_range(0, 15);
      // Iniciar la transacción
      MODE0_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones
      #20;
    end
    #1000;
    $finish;
	phase.drop_objection(this);
  endtask
endclass



class test_MODE1 extends test;
  `uvm_component_utils(test_MODE1); // Register at the factory
  function new(string name = "test_MODE1", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    MODE1_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO 1");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = $urandom_range(0, 15);
      // Iniciar la transacción
      MODE1_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones
      #20;
    end
    #1000;
    //$finish;
	phase.drop_objection(this);
  endtask
endclass

class test_RETARDO extends test;
  `uvm_component_utils(test_RETARDO); // Register at the factory
  function new(string name = "test_RETARDO", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    RETARDO_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO RETARDO");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = $urandom_range(0, 15);
      // Iniciar la transacción
      RETARDO_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones
    #20;  
    end
    #1000;
    $finish;
	phase.drop_objection(this);
  endtask
endclass

class test_UNO_A_TODOS extends test;
  `uvm_component_utils(test_UNO_A_TODOS); // Register at the factory
  function new(string name = "test_UNO_A_TODOS", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    UNO_A_TODOS_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO UNO_A_TODOS");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = 5;
      // Iniciar la transacción
      UNO_A_TODOS_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones
     #20; 
    end
    #1000;
    $finish;
	phase.drop_objection(this);
  endtask
endclass


class test_TODOS_A_UNO extends test;
  `uvm_component_utils(test_TODOS_A_UNO); // Register at the factory
  function new(string name = "test_TODOS_A_UNO", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    TODOS_A_UNO_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO TODOS_A_UNO");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = $urandom_range(0, 15);
      // Iniciar la transacción
      TODOS_A_UNO_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones
    #20;
    end
    #1000;
    $finish;
	phase.drop_objection(this);
  endtask
endclass



class test_DESTINO_INVALIDO extends test;
  `uvm_component_utils(test_DESTINO_INVALIDO); // Register at the factory
  function new(string name = "test_DESTINO_INVALIDO", uvm_component parent=null); // Builder
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    DESTINO_INVALIDO_test.randomize() with {trans_num inside{[1:2]};};
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_warning("ALERTA","INICIA TEST EN MODO DESTINO INVALIDO");
    for (int i = 0; i < 100; i++) begin
      automatic int a;
      a = $urandom_range(0, 15);
      // Iniciar la transacción
      DESTINO_INVALIDO_test.start(amb_inst.agent_inst.seq_inst[a]);
      // Esperar un tiempo entre transacciones 
      #20;
    end
    #1000;
    $finish;
	phase.drop_objection(this);
  endtask
endclass



