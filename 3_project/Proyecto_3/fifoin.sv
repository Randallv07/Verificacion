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


function Fin_push(bit [pckg_sz-1:0] dato); // Push de la FIFO in
		this.FIFO_IN.push_back(dato);
		this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0];
		this.vif.pndng_i_in[this.id_fifo] = 1;
endfunction

task interfaz();
	//$display("FIFO #%d: ingresa dato al bus",this.id_fifo);
	  this.vif.pndng_i_in[this.id_fifo] = 0;
	forever begin
		if(this.FIFO_IN.size==0) begin 
			this.vif.pndng_i_in[this.id_fifo] = 0;
			this.vif.data_out_i_in[this.id_fifo] = 0;
		end
		else begin
			this.vif.pndng_i_in[this.id_fifo] = 1;
			this.vif.data_out_i_in[this.id_fifo] = FIFO_IN[0];
		end
		  @(posedge this.vif.popin[this.id_fifo]);
	  if(this.FIFO_IN.size>0) begin this.FIFO_IN.delete(0);
	
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