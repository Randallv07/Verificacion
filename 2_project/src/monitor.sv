// Monitor
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Este objeto es responsable de leer las señales de salida del DUT.

///////////////////////////////////////////////////////////////////////////////////////////////
 // monitor: este objeto es responsable de obtener las salidas del DUT y pasarlos al Checker //
 //////////////////////////////////////////////////////////////////////////////////////////////
class monitor #(parameter drvrs = 4, parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4);
virtual bus_mesh_if #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth)) vif; // Se genera la conexión por medio de interface
trans_monitor_checker trans_monitor_checker_mnt;
monitor_checker_mb monitor_checker_mb_mnt;

bit [pckg_sz-1:0] queue[$]; // Cola de entrada
int id_mntr; // Identificador de monitor



function new(int ID); // Se inicia el constructor
    this.queue = {}; 
    this.id_mntr = ID;
    //$display("[%g]  El Monitor [%g] inicializado", $time, id_mntr);
endfunction

task run(); // Inicia el task
  this.vif.pop[this.id_mntr] = 0; //inicia el pop en 0
    forever begin
        @(posedge this.vif.clk);

        if (this.vif.pndng[this.id_mntr] == 1) begin // Si se acticva la señal de pndgn
          this.vif.pop[this.id_mntr] = 1; // Activa el pop
          this.queue.push_back(this.vif.data_out[this.id_mntr]); // Captura el dato en el queue
          ///////////////////////////////////////////////////
          this.trans_monitor_checker_mnt = new(this.id_mntr);
          this.trans_monitor_checker_mnt.fila = this.vif.data_out[id_mntr][pckg_sz-9:pckg_sz-12];
          this.trans_monitor_checker_mnt.columna = this.vif.data_out[id_mntr][pckg_sz-13:pckg_sz-16];
          this.trans_monitor_checker_mnt.pyld = this.vif.data_out[id_mntr][pckg_sz-26:0];
          this.trans_monitor_checker_mnt.llave = this.vif.data_out[id_mntr][pckg_sz-1:0];
          this.monitor_checker_mb_mnt.put(trans_monitor_checker_mnt);
          
          //asersiones monitor
          
          assert(this.vif.pop[this.id_mntr])begin //no hace pop cuando hay dato pendiente
          //$display("[PASS] DUT captura datos##########################################################################################################################3");
        end
        else begin
          $error("########################################################Monitor no captura datos del DUT##########################################################################################################");
        end
          
          assert(this.vif.data_out[id_mntr][pckg_sz-26:0] != {pckg_sz-26{1'b0}})begin // el payload es 0 puede haber error en transacción
            //$Display("########################################################## Payload es  común ################################################################3");
        end
        else begin
          $warning("########################################################## Payload es 0 puede existir error################################################################3");
        end

          
          //display("[%g] El monitor [%d] [%d] capturo el dato %h de la fuente: [%d] [%d] en modo %b", $time, this.vif.data_out[id_mntr][pckg_sz-9:pckg_sz-12], this.vif.data_out[id_mntr][pckg_sz-13:pckg_sz-16], this.vif.data_out[id_mntr][pckg_sz-26:0], this.vif.data_out[id_mntr][pckg_sz-18:pckg_sz-21],  this.vif.data_out[id_mntr][pckg_sz-22:pckg_sz-25],this.vif.data_out[id_mntr][pckg_sz-17]);
            @(posedge this.vif.clk);
                     this.vif.pop[this.id_mntr] = 0; // Vuelve el pop a 0
        end
        else begin // Si no se activa el pndng no hace pop
          this.vif.pop[this.id_mntr] = 0;
        end
    end
endtask 
endclass

