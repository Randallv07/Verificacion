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
// Agente: Este bloque se encarga de generar las secuencias de eventos para el driver //
////////////////////////////////////////////////////////////////////////////////////////

class Agente #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4, parameter drvrs = ROWS*2 + COLUMS*2);
//Mailbox
agent_driver_mb #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz)) agent_driver_mb_a [ROWS*2+COLUMS*2];
gen_agent_mb gen_agent_mb_a;

//Transacción
trans_agent_driver #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz)) trans_agent_driver_a;
trans_gen_agent trans_gen_agent_a;

//Variables principales
int num_transac;
int retardo;
int fuente;

//clase posición
Mapeo_colum_fila pos_driver_a[ ROWS*2 + COLUMS*2];

function new();
    this.trans_agent_driver_a = new();
    this.trans_gen_agent_a = new();

    for(int i = 0; i < drvrs; i++) begin
        automatic int k = i;	
        this.agent_driver_mb_a[k] = new();
    end

    for(int i = 0; i < drvrs; i++) begin
        automatic int k = i;	
        pos_driver_a[k] = new();
    end

    for (int i = 0; i<COLUMS;i++)begin 
        pos_driver_a[i].fila = 0;              
        pos_driver_a[i].colum = i+1; 
    end 
    for (int i = 0; i<ROWS;i++)begin 
        pos_driver_a[i+COLUMS].colum = 0; 
        pos_driver_a[i+COLUMS].fila = i+1; 
    end 
    for (int i = 0; i<COLUMS;i++)begin 
        pos_driver_a[i+ROWS*2].fila = ROWS+1; 
        pos_driver_a[i+ROWS*2].colum = i+1; 
    end
    for (int i = 0; i<ROWS;i++)begin 
        pos_driver_a[i+COLUMS*3].colum = COLUMS+1; 
        pos_driver_a[i+COLUMS*3].fila = i+1; 
    end         
  
  
/*
    foreach (pos_driver_a[i]) begin
      $display("Driver: %d ROW=%0d COL=%0d",i,pos_driver_a[i].fila,pos_driver_a[i].colum);
    end
*/
    $display("Agente inicializado");
endfunction

task run();
    forever begin
        this.gen_agent_mb_a.get(this.trans_gen_agent_a); // captura la transacción del generador
        this.num_transac = this.trans_gen_agent_a.cant_transac;
     

        //Variabilidad de datos
        for (int i = 0; i < this.num_transac; i++) begin
            this.trans_agent_driver_a = new();
            this.trans_agent_driver_a.pos_driver = this.pos_driver_a;
            
            case (this.trans_gen_agent_a.tipo_dato)
                Variab:begin
                    trans_agent_driver_a.variabilidad_dato.constraint_mode(1);
                end

                aleat:begin
                    trans_agent_driver_a.variabilidad_dato.constraint_mode(0);
                end

                default: begin
                    trans_agent_driver_a.variabilidad_dato.constraint_mode(0);
                end
            endcase
          

            // Pruebas
            case (this.trans_gen_agent_a.tipo_envio)
                Normal:begin
                  //Transacciones validas
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(0);
                    trans_agent_driver_a.MODO_0.constraint_mode(0);
                  //retardo
                  trans_agent_driver_a.retardo_0.constraint_mode(0);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(1);
                  //fuente estatica
                  trans_agent_driver_a.Fuente_estatica.constraint_mode(0);
                end
              
                fila_columna_1:begin
                  //Transacciones validas
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                  trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(1);
                    trans_agent_driver_a.MODO_0.constraint_mode(0);
                  //retardo
                  trans_agent_driver_a.retardo_0.constraint_mode(1);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(0);
                  //fuente estatica
                  trans_agent_driver_a.Fuente_estatica.constraint_mode(0);
                  
                end
              
                columna_fila_0:begin
                  //Transacciones validas
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(0);
                  trans_agent_driver_a.MODO_0.constraint_mode(1);
                  //retardo
                  trans_agent_driver_a.retardo_0.constraint_mode(1);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(0);
                  //fuente estatica
                  trans_agent_driver_a.Fuente_estatica.constraint_mode(0);
                end
              
              fuente_estatica:begin
                  //Transacciones validas
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(0);
                    trans_agent_driver_a.MODO_0.constraint_mode(0);
                  //retardo
                    trans_agent_driver_a.retardo_0.constraint_mode(1);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(0);
                  //fuente estatica
                trans_agent_driver_a.Fuente_estatica.constraint_mode(1);
                end
              
                retardo_mode:begin
                  //Transacciones validas
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(0);
                  trans_agent_driver_a.MODO_0.constraint_mode(0);
                  //retardo
                  trans_agent_driver_a.retardo_0.constraint_mode(0);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(1);
                  //fuente estatica
                  trans_agent_driver_a.Fuente_estatica.constraint_mode(0);
                end
              

                Direccion_invalida:begin
                  //Transacciones validas
                  trans_agent_driver_a.Existe_fuente.constraint_mode(0);
                  trans_agent_driver_a.Existe_direccion.constraint_mode(0);
                  trans_agent_driver_a.send_self.constraint_mode(1);
                  //Modo
                    trans_agent_driver_a.MODO_1.constraint_mode(0);
                  trans_agent_driver_a.MODO_0.constraint_mode(0);
                  //retardo
                  trans_agent_driver_a.retardo_0.constraint_mode(1);
                  trans_agent_driver_a.retardo_aleat.constraint_mode(0);
                  //fuente estatica
                  trans_agent_driver_a.Fuente_estatica.constraint_mode(0);              
                end
                
                Fuente_invalida:begin
                    trans_agent_driver_a.Existe_fuente.constraint_mode(0);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    //trans_agent_driver_a.send_self.constraint_mode(1);                    
                end

                send_self: begin
                    trans_agent_driver_a.Existe_fuente.constraint_mode(1);
                    trans_agent_driver_a.Existe_direccion.constraint_mode(1);
                    //trans_agent_driver_a.send_self.constraint_mode(0); 
                end

            endcase
            
            if(this.trans_gen_agent_a.modo_aleat == 0) trans_agent_driver_a.modo = trans_gen_agent_a.modo_sel;
            this.trans_agent_driver_a.randomize(); // Se randomizan las transacciones
          
          //fuente estatica
          
            if(this.trans_gen_agent_a.fuente_aleat==0) trans_agent_driver_a.fuente_aux = trans_gen_agent_a.fuente;
          //Destino estatico
          if(this.trans_gen_agent_a.destino_aleat==0) begin
            trans_agent_driver_a.c_fila = trans_gen_agent_a.fila;
            trans_agent_driver_a.c_columna = trans_gen_agent_a.columna;
          end

    //this.trans_agent_driver_a.destino = pos_driver_a;
            this.trans_agent_driver_a.tiempo = $time;
            this.agent_driver_mb_a[this.trans_agent_driver_a.fuente].put(this.trans_agent_driver_a);
            #1;

        end

    end
    
endtask

endclass

