class scoreboard #(parameter pckg_sz = 32);
  driver_scoreboard_mb  driver_scoreboard_mb_sc;  // Define el mailbox que conecta el driver con el scoreboard
  trans_driver_scoreboard #(.pckg_sz(pckg_sz)) trans_driver_scoreboard_sc; //Define la transaccion del driver al scoreboard
  
  //scoreboard_checker_mb  scoreboard_checker_mb_sc; // Define el mailbox que conecta el scoreboard con el checker
  
  task run();
    forever begin
      driver_scoreboard_mb_sc.get(trans_driver_scoreboard_sc); // coloca la transaccion del driver al scoreboard en el mailbox
      $display("MODE: [%0d]",trans_driver_scoreboard_sc.paquete[pckg_sz-17]); //Accede a la posicion del paquete de datos donde se indica el modo
      $display("ORIGEN: [%0d] [%0d] DESTINO: [%0d] [%0d]",trans_driver_scoreboard_sc.filas,trans_driver_scoreboard_sc.colums, trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12], trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16]); //Accede a la posiciones del paquete donde se indica la fila y columna del target y las filas y columnas de destino.
      case(trans_driver_scoreboard_sc.paquete[pckg_sz-17]) // Hace un case del modo fila 1ero o columna 1ero
        0:begin
          if((trans_driver_scoreboard_sc.filas <=trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12])) begin //Si el # de fila  de la trans del driver al scoreboard es menor a la especificada en el paquete de datos
            if(trans_driver_scoreboard_sc.colums <= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16])begin //Si el # de columna de la trans del driver al scoreboard es menor a la especificada en el paquete de datos
              for(int r = trans_driver_scoreboard_sc.filas; r<= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r++)begin //Incrementar el # de filas de la trans driver al scoreboard hasta que sea igual al # de fila indicado en el paquete de datos.
                for (int c = trans_driver_scoreboard_sc.colums; c<= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c++ )begin //Incrementar el # de columnas de la trans driver al scoreboard hasta que sea igual al # de columnas indicado en el paquete de datos.
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r][c] = 1; //Pone en alto el 
                end
              end
          	end
          	else begin
              for(int r = trans_driver_scoreboard_sc.filas; r<= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r++)begin //Sino incrementa el # de filas de la trans_dvr_sb hasta que sea el numero especificado en el paquete de datos.
                for (int c = trans_driver_scoreboard_sc.colums+1; c > trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c-- )begin // Y disminuye el # de columnas del trans_drv_sb hasta que sea el # especificado en el paquete de datos 
                  //$display("Valor de R %0d C %0d",r,c-1);
                  trans_driver_scoreboard_sc.trayectoria[r][c-1] = 1;
                end
              end
            end
          end
          if((trans_driver_scoreboard_sc.filas >= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12])) begin //Si el # de filas es mayor o igual al especificado en el paquete.
            if(trans_driver_scoreboard_sc.colums <= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16])begin // Si # de columnas es menor o igual al especificado en el paquete 
              for(int r = trans_driver_scoreboard_sc.filas+1; r> trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r--)begin  // Le suma 1 a las filas y luego las decrementa hasta que r sea menor del tamaño establecido en el paquete.
                for (int c = trans_driver_scoreboard_sc.colums; c<= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c++ )begin // Incrementar el # de columnas hasta que c alcance el # establecido en el paquete de datos.
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r-1][c] = 1;
                end
              end
          	end
          	else begin
              for(int r = trans_driver_scoreboard_sc.filas+1; r > trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r--)begin //  Sino Suma 1 a las filas y decrementar r hasta que sea menor al # de filas establecidas en el paquete
                for (int c = trans_driver_scoreboard_sc.colums+1; c > trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c--)begin //Sino suma 1 a la columna y decrementa hasta que el # de coloumnas sea menor al establecido en el paquete de datos
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r-1][c-1] = 1;
                end
              end
            end
          end
        end
        1:begin
          if((trans_driver_scoreboard_sc.filas <=trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12])) begin
            if(trans_driver_scoreboard_sc.colums <= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16])begin
              for(int r = trans_driver_scoreboard_sc.filas; r<= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r++)begin
                for (int c = trans_driver_scoreboard_sc.colums; c<= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c++ )begin
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r][c] = 1;
                end
              end
          	end
          	else begin
              for(int r = trans_driver_scoreboard_sc.filas; r<= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r++)begin
                for (int c = trans_driver_scoreboard_sc.colums+1; c > trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c-- )begin
                  //$display("Valor de R %0d C %0d",r,c-1);
                  trans_driver_scoreboard_sc.trayectoria[r][c-1] = 1;
                end
              end
            end
          end
          if((trans_driver_scoreboard_sc.filas >= trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12])) begin
            if(trans_driver_scoreboard_sc.colums <= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16])begin
              for(int r = trans_driver_scoreboard_sc.filas+1; r> trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r--)begin
                for (int c = trans_driver_scoreboard_sc.colums; c<= trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c++ )begin
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r-1][c] = 1;
                end
              end
          	end
          	else begin
              for(int r = trans_driver_scoreboard_sc.filas+1; r > trans_driver_scoreboard_sc.paquete[pckg_sz-9:pckg_sz-12];r--)begin
                for (int c = trans_driver_scoreboard_sc.colums+1; c > trans_driver_scoreboard_sc.paquete[pckg_sz-13:pckg_sz-16];c--)begin
                  //$display("Valor de R %0d C %0d",r,c);
                  trans_driver_scoreboard_sc.trayectoria[r-1][c-1] = 1;
                end
              end
            end
          end
        end
      endcase
    
    /*$display("FIFO R[%0d] C[%0d] Paquete %b",trans_driver_scoreboard_sc.filas,trans_driver_scoreboard_sc.colums,trans_driver_scoreboard_sc.paquete);
    for (int i = 0; i <=5 ; i++)begin
      for (int j = 0; j <= 5; j++) begin
        $display("[%0d]",trans_driver_scoreboard_sc.trayectoria[i][j]);
      end
    end
    */
      //sb_chk_mbx.put(trans_driver_scoreboard_sc);
    end 
  endtask
  
endclass