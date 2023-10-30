/* Este módulo se encarga de indicarle al agente los parámetros de los
Datos que debe generar para cada uno de los test                    */

class Generador #(parameter drvrs = 4, parameter pckg_sz = 16);
 
 //Define los mailboxes 
  test_gen_mb test_gen_mb_g;
  gen_agent_mb gen_agent_mb_g;

//Define los tipos de las transacciones
  trans_test_gen trans_test_gen_g;
  trans_gen_agent trans_gen_agent_g;
  rand_parameter pkt;
  

  

  //Inicializa las clases que especifican las transacciones Generador-Agent
//y Test-agente hay definir dichas clases en el modulo mailbox
  function new();
    this.trans_gen_agent_g = new();
    this.trans_test_gen_g = new();
    this.pkt = new();    
  endfunction 

  task run ();
    forever begin
    pkt.size_cant_transac.constraint_mode(1); // Establece el modo de restricción en el objeto 'pkt'
    pkt.randomize();
    test_gen_mb_g.get(trans_test_gen_g); //Mailbox del test-agente obtiene transaccion del test-agente 
	$display("GENERADOR: Transaccion recivida de TEST recibida en %d",$time);    
    case (this.trans_test_gen_g.tipo_prueba)
      mode_1:begin
        this.trans_gen_agent_g.cant_transac= 100;//pkt.cant_transac_aleat;  //Se define el # de transacciones por terminal.
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = fila_columna_1;
        //fuente
        this.trans_gen_agent_g.fuente_aleat = 0;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        //modo
        this.trans_gen_agent_g.modo_aleat = 0;
        this.trans_gen_agent_g.modo_sel = 1;
        gen_agent_mb_g.put(trans_gen_agent_g); // almacena la transaccion del generador-agente en el mailbox de generador agente
      end

      mode_0:begin
        this.trans_gen_agent_g.cant_transac= 100;  //Se define el # de transacciones por terminal.
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = columna_fila_0;
        //fuente
        this.trans_gen_agent_g.fuente_aleat = 1;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        //modo
        this.trans_gen_agent_g.modo_aleat = 0;
        this.trans_gen_agent_g.modo_sel = 0;
        gen_agent_mb_g.put(trans_gen_agent_g);// almacena la transaccion del generador-agente en el mailbox de generador agente
      end
      
      uno_a_todos:begin
        this.trans_gen_agent_g.cant_transac = 30;
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = fuente_estatica;
        //fuente
        this.trans_gen_agent_g.fuente_aleat = 0;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        gen_agent_mb_g.put(trans_gen_agent_g); // almacena la transaccion del generador-agente en el mailbox de generador agente
      end
      
       todos_a_uno:begin
        this.trans_gen_agent_g.cant_transac = 30;
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = Normal;
        //fuente
        this.trans_gen_agent_g.fuente_aleat = 1;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 0;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        gen_agent_mb_g.put(trans_gen_agent_g); // almacena la transaccion del generador-agente en el mailbox de generador agente
      end

      retardo_aleat:begin
        this.trans_gen_agent_g.cant_transac= 30;  //Se define el # de transacciones por terminal.
        this.trans_gen_agent_g.tipo_dato = Variab;
        this.trans_gen_agent_g.tipo_envio = retardo_mode;
        //fuente
        this.trans_gen_agent_g.fuente_aleat = 1;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        //modo
        this.trans_gen_agent_g.modo_aleat = 0;
        this.trans_gen_agent_g.modo_sel = 0;
        gen_agent_mb_g.put(trans_gen_agent_g);// almacena la transaccion del generador-agente en el mailbox de generador agente
      end
      
      todo_aleat:begin
        $display("Cantidad de transacciones = %d", pkt.cant_transac_aleat);
        $display("fifo depth = %d", pkt.cant_transac_aleat);
        $display("pckg size = %d",pkt.cant_transac_aleat);
        this.trans_gen_agent_g.cant_transac = pkt.cant_transac_aleat;
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = Normal;//fuente
        this.trans_gen_agent_g.fuente_aleat = 1;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        //modo
        this.trans_gen_agent_g.modo_aleat = 0;
        this.trans_gen_agent_g.modo_sel = 0;
        gen_agent_mb_g.put(trans_gen_agent_g);
      end
      
      no_direccion:begin
        this.trans_gen_agent_g.cant_transac = 50;
        this.trans_gen_agent_g.tipo_dato = aleat;
        this.trans_gen_agent_g.tipo_envio = Direccion_invalida;//fuente
        this.trans_gen_agent_g.fuente_aleat = 1;
        this.trans_gen_agent_g.fuente = 1;
        //Destino
        this.trans_gen_agent_g.destino_aleat = 1;
        this.trans_gen_agent_g.fila = 0;
        this.trans_gen_agent_g.columna = 1;
        //modo
        this.trans_gen_agent_g.modo_aleat = 0;
        this.trans_gen_agent_g.modo_sel = 0;
        gen_agent_mb_g.put(trans_gen_agent_g);
      end

      default: begin
        this.trans_gen_agent_g.cant_transac = 30;
        gen_agent_mb_g.put(trans_gen_agent_g);
      end 
      
	endcase
end
    
    
    
  endtask
  
endclass