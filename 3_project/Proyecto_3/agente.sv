// Agente
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Ayuda a acomodar las transacciones.

////////////////////////////////////////////////////////////////////////////////////////
// Agente: Este bloque se encarga de generar las secuencias de eventos para el driver e instanciar el monitor //
////////////////////////////////////////////////////////////////////////////////////////

class agent extends uvm_agent;
	`uvm_component_utils(agent); // Register at the factory

	function new(string name = "agent", uvm_component parent=null); // Builder
		super.new(name,parent);
	endfunction

  //parametros
  parameter int ROWS = 4;
  parameter int COLUMS = 4;
  parameter int pckg_sz = 40;

	driver#(item)	      	 	    drv_inst[15:0];	// Instancia del driver
	monitor#(item) 	            mnt_inst[15:0];	// Instancia del monitor
  uvm_sequencer #(item)   seq_inst[15:0]; //Instancia del sequencer
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
      	for (int i=0; i<16 ; i++ ) begin
      		automatic int a=i;
      		drv_inst[a] = driver::type_id::create($sformatf("drv_inst%0d",a),this);  
          	mnt_inst[a] = monitor::type_id::create($sformatf("mnt_inst%0d",a),this);  
          seq_inst[a] = uvm_sequencer#(item)::type_id::create($sformatf("seq_inst%0d",a), this);
    	end
      	// Inicializa fuentes en fila y columna
        for (int i = 0; i<COLUMS;i++)begin 
          drv_inst[i].f_fila = 0;              
          drv_inst[i].f_columna = i+1; 
        end 
        for (int i = 0; i<ROWS;i++)begin 
            drv_inst[i+COLUMS].f_columna = 0; 
            drv_inst[i+COLUMS].f_fila = i+1; 
        end 
        for (int i = 0; i<COLUMS;i++)begin 
            drv_inst[i+ROWS*2].f_fila = ROWS+1; 
            drv_inst[i+ROWS*2].f_columna = i+1; 
        end 
        for (int i = 0; i<ROWS;i++)begin 
          drv_inst[i+COLUMS*3].f_columna = COLUMS+1; 
            drv_inst[i+COLUMS*3].f_fila = i+1; 
    	end 
	endfunction

	virtual function void connect_phase(uvm_phase phase); //Fase de conexion
		super.connect_phase(phase);
      	for (int i=0; i<16 ; i++ ) begin
        	automatic int a=i;
          	drv_inst[a].id_driver=a;// para que cada driver sepa que numero es
          	mnt_inst[a].id_monitor=a;// para que cada monitor sepa que numero
          drv_inst[a].seq_item_port.connect(seq_inst[a].seq_item_export);
        end
	endfunction

endclass
