// FiFo
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en SystemVerilog
// Propósito General: Diseño de pruebas en capas para un BUS de datos
// Modulo: Comunica el driver con el DUT

////////////////////////////////////////////////////////////////
// fifo_in: Este bloque se encarga de mandar los datos al DUT //
////////////////////////////////////////////////////////////////

class fifo_in #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4);

bit [pckg_sz-1:0] FIFO_IN[$]; //Queue llamada FIFO_IN
int id_fifo;
virtual bus_mesh_if #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz),.fifo_depth(fifo_depth)) vif;

function new (int ID); //id_fifo identifica el numero de fifo correspondiente a la instancia
	FIFO_IN = {}; //Inicializa la Queue vacia 
	this.id_fifo = ID; //Asigna un numero a la variable id_fifo, segun el numero de iteraciones que se haga en el testbench		
endfunction


function Fin_push(bit [pckg_sz-1:0] dato); // Hace el push hacia adentro de la fifo_in
		this.FIFO_IN.push_back(dato); //Agrega el dato al final de la cola 
		this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0]; //Envia el dato de la posicion 0 del queue al decodificador del bus
		this.vif.pndng_i_in[this.id_fifo] = 1; //Levanta el pending para indicar que debe leer el dato_out_i_in que va a ingresar a una terminal correspondiente definida por id_fifo
endfunction

task interfaz();
	  this.vif.pndng_i_in[this.id_fifo] = 0;
	forever begin
		if(this.FIFO_IN.size==0) begin  //Si el tamaño de la queue es 0 
			this.vif.pndng_i_in[this.id_fifo] = 0; // Asigna el pending de entrada a 0 porque no hay nada que enviar en la queue
			this.vif.data_out_i_in[this.id_fifo] = 0; //Asigna el contenido de data_out_i_in a 0 porque no hay nada que enviar en la queue
		end
		else begin //Si el tamaño de la queue es diferente de 0
			this.vif.pndng_i_in[this.id_fifo] = 1; //Se asigna el pending de entrada en 1 porque si hay datos que enviar de la queue
			this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0]; //Asigna el contenido de data_out_i_in al valor de la  posicion 0 de la queue
		end
		  @(posedge this.vif.popin[this.id_fifo]); // Como el dato ya está almacenado en data_out_i_in de una respectiva terminal si el tamaño de fifo_in es mayor a cero,
	  if(this.FIFO_IN.size>0) begin this.FIFO_IN.delete(0); //Entonces se elimina la posicion de la queue porque ya este dato fue enviado a una terminal
	
	  //assersion fifo in
		assert(this.vif.popin[this.id_fifo])begin // ve si el dut esta haciendo popin para capturar dato.
		  //$display("[PASS] DUT captura datos##########################################################################################################################3");
		end
		else begin
		  $error("########################################################DUT no capturo datos##########################################################################################################");
		end
  end
	end

endtask
endclass


