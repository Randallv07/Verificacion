class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  parameter int pckg_sz = 40;

  bit [3:0] filas; 
  bit [3:0] colums;
  bit [pckg_sz-1:0] paquete; ///
  int trayectoria [5][5];
  
  uvm_analysis_imp #(item,scoreboard) m_analysis_imp;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name,parent);
    m_analysis_imp = new("m_analysis_imp",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    
     phase.raise_objection(this);
    `uvm_warning("Se inicializó el scoreboard", get_type_name())
     phase.drop_objection(this);
    
  endtask
  
  function write (item s_item);

    case(s_item.modo) // Hace un case del modo fila 1ero o columna 1ero
      0:begin
        if((filas <=s_item.d_fila)) begin //Si el # de fila  de la trans del driver al scoreboard es menor a la especificada en el paquete de datos
          if(colums <= s_item.d_columna)begin //Si el # de columna de la trans del driver al scoreboard es menor a la especificada en el paquete de datos
            for(int r = filas; r<= s_item.d_fila;r++)begin //Incrementar el # de filas de la trans driver al scoreboard hasta que sea igual al # de fila indicado en el paquete de datos.
              for (int c = colums ; c<= s_item.d_columna;c++ )begin //Incrementar el # de columnas de la trans driver al scoreboard hasta que sea igual al # de columnas indicado en el paquete de datos.
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r][c] = 1; //Pone en alto el 
              end
            end
          end
          else begin
            for(int r = filas; r<= s_item.d_fila;r++)begin //Sino incrementa el # de filas de la trans_dvr_sb hasta que sea el numero especificado en el paquete de datos.
              for (int c = colums +1; c > s_item.d_columna;c-- )begin // Y disminuye el # de columnas del trans_drv_sb hasta que sea el # especificado en el paquete de datos 
                //$display("Valor de R %0d C %0d",r,c-1);
                trayectoria[r][c-1] = 1;
              end
            end
          end
        end
        if((filas >= s_item.d_fila)) begin //Si el # de filas es mayor o igual al especificado en el paquete.
          if(colums <= s_item.d_columna)begin // Si # de columnas es menor o igual al especificado en el paquete 
            for(int r = filas+1; r> s_item.d_fila;r--)begin  // Le suma 1 a las filas y luego las decrementa hasta que r sea menor del tamaño establecido en el paquete.
              for (int c = colums ; c<= s_item.d_columna;c++ )begin // Incrementar el # de columnas hasta que c alcance el # establecido en el paquete de datos.
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r-1][c] = 1;
              end
            end
          end
          else begin
            for(int r = filas+1; r > s_item.d_fila;r--)begin //  Sino Suma 1 a las filas y decrementar r hasta que sea menor al # de filas establecidas en el paquete
              for (int c = colums +1; c > s_item.d_columna;c--)begin //Sino suma 1 a la columna y decrementa hasta que el # de coloumnas sea menor al establecido en el paquete de datos
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r-1][c-1] = 1;
              end
            end
          end
        end
      end
      1:begin
        if((filas <=s_item.d_fila)) begin
          if(colums <= s_item.d_columna)begin
            for(int r = filas; r<= s_item.d_fila;r++)begin
              for (int c = colums ; c<= s_item.d_columna;c++ )begin
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r][c] = 1;
              end
            end
          end
          else begin
            for(int r = filas; r<= s_item.d_fila;r++)begin
              for (int c = colums +1; c > s_item.d_columna;c-- )begin
                //$display("Valor de R %0d C %0d",r,c-1);
                trayectoria[r][c-1] = 1;
              end
            end
          end
        end
        if((filas >= s_item.d_fila)) begin
          if(colums <= s_item.d_columna)begin
            for(int r = filas+1; r> s_item.d_fila;r--)begin
              for (int c = colums ; c<= s_item.d_columna;c++ )begin
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r-1][c] = 1;
              end
            end
          end
          else begin
            for(int r = filas+1; r > s_item.d_fila;r--)begin
              for (int c = colums +1; c > s_item.d_columna;c--)begin
                //$display("Valor de R %0d C %0d",r,c);
                trayectoria[r-1][c-1] = 1;
              end
            end
          end
        end
      end
    endcase



  endfunction
  
endclass

