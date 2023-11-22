class my_sequence extends uvm_sequence;

    `uvm_object_utils(my_sequence)
    function new (string name="my_sequence");
        super.new(name);
    endfunction
    parameter int ROWS = 4;
  parameter int COLUMS = 4;
  parameter int pckg_sz = 40;

    //`uvm_declare_p_sequencer() Debe agregarse?

    rand int trans_num;
  mapeo pos_driver [COLUMS*2+ROWS*2];

    constraint trans_limit {soft trans_num inside {[50:100]};}
  
    function void build_phase(uvm_phase phase);

    endfunction

    virtual task body();
      
      	for (int i = 0; i<ROWS*2+COLUMS*2; i++) begin
                automatic int k = i;
                pos_driver[k] = new();
        end
      
    	for (int i = 0; i<COLUMS;i++)begin 
          pos_driver[i].fila = 0;              
        	pos_driver[i].column = i+1; 
    	end 
        for (int i = 0; i<ROWS;i++)begin 
            pos_driver[i+COLUMS].column = 0; 
            pos_driver[i+COLUMS].fila = i+1; 
        end 
        for (int i = 0; i<COLUMS;i++)begin 
            pos_driver[i+ROWS*2].fila = ROWS+1; 
            pos_driver[i+ROWS*2].column = i+1; 
        end 
        for (int i = 0; i<ROWS;i++)begin 
            pos_driver[i+COLUMS*3].column = COLUMS+1; 
          pos_driver[i+COLUMS*3].fila = i+1; 
        end 
      
        for (int i = 0; i < trans_num; i++) begin 
            item s_item = item::type_id::create("s_item");
          	s_item.pos_driver = pos_driver;
            //Transacciones validas
            s_item.Existe_fuente.constraint_mode(1);
            s_item.Existe_direccion.constraint_mode(1);
            //s_item.send_self.constraint_mode(1);
            //Modo
            s_item.MODO_1.constraint_mode(0);
            s_item.MODO_0.constraint_mode(0);
            //retardo
          s_item.retardo_0.constraint_mode(1);
          s_item.retardo_aleat.constraint_mode(0);
            //fuente estatica
          //s_item.Fuente_estatica.constraint_mode(1);
            start_item(s_item);
          	
            s_item.randomize() with {d_fila != f_fila; d_columna != f_columna;};
          
          //m_trans.randomize() with { row != terminales[seqdrvSource]/10; colum != terminales[seqdrvSource]%10;};
            //`uvm_info("Sequenciador",$sformatf("Se genera nuevo item", s_item.print_transaccion()), UVM_HIGH);
            finish_item(s_item);
        end 
        //`uvm_info("Sequenciador",$sformatf("El numero de transacciones es  %0d", trans_num), UVM_MEDIUM);
    endtask
endclass



class MODE0 extends uvm_sequence;
  `uvm_object_utils(MODE0)
  function new (string name="MODE0");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin 
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(1);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(0);
      s_item.MODO_0.constraint_mode(1);
      //retardo
      s_item.retardo_0.constraint_mode(1);
      s_item.retardo_aleat.constraint_mode(0);
      //fuente estatica
      s_item.Fuente_estatica.constraint_mode(0);
      s_item.variabilidad_dato.constraint_mode(0);
      s_item.Destino_estatico.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      finish_item(s_item);
    end
    
  endtask
endclass

class MODE1 extends uvm_sequence;
  `uvm_object_utils(MODE1)
  function new (string name="MODE1");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin 
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(1);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(1);
      s_item.MODO_0.constraint_mode(0);
      //retardo
      s_item.retardo_0.constraint_mode(1);
      s_item.retardo_aleat.constraint_mode(0);
      s_item.variabilidad_dato.constraint_mode(0);
      //fuente estatica
      s_item.Fuente_estatica.constraint_mode(0);
      s_item.Destino_estatico.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      //`uvm_info("FINALIZA MODO 1", $sformatf("Comenzando la simulación en %0t", $realtime), UVM_LOW)
      finish_item(s_item);
    end
    
  endtask
endclass


class MODE_RETARDO extends uvm_sequence;
  `uvm_object_utils(MODE_RETARDO)
  function new (string name="MODE_RETARDO");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(1);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(0);
      s_item.MODO_0.constraint_mode(0);
      //retardo
      s_item.retardo_0.constraint_mode(0);
      s_item.retardo_aleat.constraint_mode(1);
      s_item.variabilidad_dato.constraint_mode(1);
      s_item.Fuente_estatica.constraint_mode(0);
      s_item.Destino_estatico.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      finish_item(s_item);
    end
    
  endtask
endclass


class UNO_A_TODOS extends uvm_sequence;
  `uvm_object_utils(UNO_A_TODOS)
  function new (string name="UNO_A_TODOS");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin 
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(1);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(0);
      s_item.MODO_0.constraint_mode(0);
      //retardo
      s_item.retardo_0.constraint_mode(1);
      s_item.retardo_aleat.constraint_mode(0);
      //fuente estatica
      s_item.Fuente_estatica.constraint_mode(1);
      s_item.Destino_estatico.constraint_mode(0);
      s_item.variabilidad_dato.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      finish_item(s_item);
    end
  endtask
endclass



class TODOS_A_UNO extends uvm_sequence;
  `uvm_object_utils(TODOS_A_UNO)
  function new (string name="TODOS_A_UNO");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin 
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(1);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(0);
      s_item.MODO_0.constraint_mode(0);
      //retardo
      s_item.retardo_0.constraint_mode(1);
      s_item.retardo_aleat.constraint_mode(0);
      //fuente estatica
      s_item.Fuente_estatica.constraint_mode(0);
      s_item.Destino_estatico.constraint_mode(1);
      s_item.variabilidad_dato.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      finish_item(s_item);
    end
  endtask
endclass


class DESTINO_INVALIDO extends uvm_sequence;
  `uvm_object_utils(DESTINO_INVALIDO)
  function new (string name="DESTINO_INVALIDO");
        super.new(name);
  endfunction
  
  rand int trans_num;
  constraint trans_limit {soft trans_num inside {[50:100]};};
  
  function void build_phase(uvm_phase phase);
  endfunction
  
  
  virtual task body();
    for (int i = 0; i < trans_num; i++) begin 
      item s_item = item::type_id::create("s_item");
      //Transacciones validas
      s_item.Existe_fuente.constraint_mode(1);
      s_item.Existe_direccion.constraint_mode(0);
      //s_item.send_self.constraint_mode(1);
      //Modo
      s_item.MODO_1.constraint_mode(0);
      s_item.MODO_0.constraint_mode(0);
      //retardo
      s_item.retardo_0.constraint_mode(1);
      s_item.retardo_aleat.constraint_mode(0);
      //fuente estatica
      s_item.Fuente_estatica.constraint_mode(0);
      s_item.Destino_estatico.constraint_mode(0);
      s_item.variabilidad_dato.constraint_mode(0);
      start_item(s_item);   	
      s_item.randomize();
      finish_item(s_item);
    end
  endtask
endclass

