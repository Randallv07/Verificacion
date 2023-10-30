// Driver
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en SystemVerilog
// Propósito General: Diseño de pruebas en capas para un BUS de datos
// Modulo: infraestructura necesarias para crear, ejecutar y analizar pruebas

`include "interface.sv"
`include "mailbox.sv"
`include "fifo_in.sv"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////// Driver: este módulo es el encargado de forzar señales de entrada hacia el dispositivo bajo prueba///////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Driver #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4, parameter drvrs = ROWS*2+COLUMS*2);
    logic [3:0] id_driver;
  	bit [pckg_sz-1:0] paquete;
  	bit [3:0] filas;
  	bit [3:0] colums;
  	int espera;

	fifo_in #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth)) fifo_in_d;
	agent_driver_mb #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz)) agent_driver_mb_d;
	trans_agent_driver #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz)) trans_agent_driver_d;
  driver_scoreboard_mb  driver_scoreboard_mb_d = new();  
  trans_driver_scoreboard #(.pckg_sz(pckg_sz)) trans_driver_scoreboard_d; 
	
	//Inicializar la clase fifo_in, el mailbox del agente al driver y las transacciones del agente al driver

	function new(int ID);
		this.id_driver = ID; //Asigna un numero a cada driver creado 
      this.fifo_in_d = new(id_driver);
		this.agent_driver_mb_d = new();
		this.trans_agent_driver_d = new();
		//$display ("El Driver # %d se ha inicializado", id_driver);
	endfunction
  
        // Declaración de una función que toma dos entradas y devuelve una salida
  function logic [3:0] Destino(input logic [3:0] fila, input logic [3:0] columna);
    logic [3:0] destino;
      // Realiza alguna operación basada en las entradas
           case({fila,columna})
              8'b0000_0001: destino = 4'b0000;  // 0
              8'b0000_0010: destino = 4'b0001;  // 1
              8'b0000_0011: destino = 4'b0010;  // 2
              8'b0000_0100: destino = 4'b0011;  // 3
              8'b0001_0000: destino = 4'b0100;  // 4
              8'b0010_0000: destino = 4'b0101;  // 5
              8'b0011_0000: destino = 4'b0110;  // 6
              8'b0100_0000: destino = 4'b0111;  // 7
              8'b0101_0001: destino = 4'b1000;  // 8
              8'b0101_0010: destino = 4'b1001;  // 9
              8'b0101_0011: destino = 4'b1010;  // 10
              8'b0101_0100: destino = 4'b1011;  // 11
              8'b0001_0101: destino = 4'b1100;  // 12
              8'b0010_0101: destino = 4'b1101;  // 13
              8'b0011_0101: destino = 4'b1110;  // 14
              8'b0100_0101: destino = 4'b1111;  // 15       
            default: destino = 4'b1111; // Cuando selector2:selector1 no coincide con ninguno de los casos            
          endcase
      return destino;
    endfunction

	virtual task run();
		fork
			fifo_in_d.interfaz();
		join_none
		forever begin
          this.agent_driver_mb_d.get(trans_agent_driver_d);                                          //Comunicación con el agente
		  //$display("El Driver # %d: ha recibido una transaccion",this.id_driver);
          //$display("dato = %d",this.trans_agent_driver_d.dato);
          
          //isplay("El Driver [%d] [%d]: envia el siguiente dato %h a destino: [%d] [%d] en modo: %b",this.filas, this.colums,this.trans_agent_driver_d.dato,this.trans_agent_driver_d.c_fila,this.trans_agent_driver_d.c_columna, this.trans_agent_driver_d.modo);
          //isplay("retardo = %d",this.trans_agent_driver_d.retardo);
          espera=0;
          while(espera< trans_agent_driver_d.retardo)begin//Espera para cumplir el retardo
              	@(posedge fifo_in_d.vif.clk);
			espera=espera+1;
		end
          
          
          while(this.fifo_in_d.FIFO_IN.size >= fifo_depth) #5;
          paquete = {this.trans_agent_driver_d.Next_jump,this.trans_agent_driver_d.c_fila,this.trans_agent_driver_d.c_columna,this.trans_agent_driver_d.modo,this.filas,this.colums,this.trans_agent_driver_d.dato};
          		this.fifo_in_d.Fin_push(paquete);//Manda un paquete a la FIFO  
          trans_driver_scoreboard_d = new(paquete,filas,colums,$time);
          driver_scoreboard_mb_d.put(trans_driver_scoreboard_d);
		end

	endtask
endclass
	

