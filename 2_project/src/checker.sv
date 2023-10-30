class checker #(parameter pckg_sz = 40);
  
  //Transaccion
  trans_driver_scoreboard #(.pckg_sz(pckg_sz)) trans_checker_scoreboard_chk;
  trans_monitor_checker trans_monitor_checker_chk;
  trans_driver_scoreboard #(.pckg_sz(pckg_sz)) arreglo_scoreboard [longint];
  trans_monitor_checker arreglo_monitor[longint]; 
  
  //mailbox
  scoreboard_checker_mb #(.pckg_sz(pckg_sz)) scoreboard_checker_mb_chk;
  monitor_checker_mb monitor_checker_mb_chk;
  
  int promedio = 0;
  int contador = 1;
  
  task run_scoreboard();
    forever begin
      scoreboard_checker_mb_chk.get(trans_checker_scoreboard_chk);
      arreglo_scoreboard[{trans_checker_scoreboard_chk.paquete}] = this.trans_checker_scoreboard_chk;
    end
  endtask
  
  task run_monitor();
    forever begin
      monitor_checker_mb_chk.get(trans_monitor_checker_chk);
      arreglo_monitor[{trans_monitor_checker_chk.llave}] = this.trans_monitor_checker_chk;
    end 
    
  endtask
  
  task reporte();
    
    //
    foreach (arreglo_monitor[i])begin
      promedio = promedio + arreglo_monitor[i].tiempo - arreglo_scoreboard[i].tiempo_transaccion;
    end
    $display("En las transacciones completas el retardo promedio fue de: [%d]", promedio/arreglo_monitor.size);
    
    foreach (arreglo_monitor[i])begin
      arreglo_scoreboard.delete(i);
    end
    $display("Se perdieron %d transacciones", arreglo_scoreboard.size);
    
    if (arreglo_scoreboard.size != 0) begin
    	foreach (arreglo_scoreboard[i])begin
          $display("contador: %d el paquete %d del driver [%d][%d] no llego al driver destino [%d][%d]", contador, i, arreglo_scoreboard[i].filas, arreglo_scoreboard[i].colums, arreglo_scoreboard[i].paquete[pckg_sz-9:pckg_sz-12], arreglo_scoreboard[i].paquete[pckg_sz-13:pckg_sz-16]);
          	contador = contador + 1;
    	end
    end
    else $display("Todos los paquetes se recibieron correctamente");
    
    
    
  endtask
    

endclass //checker