// Scoreboard
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Ayuda a comparar las transacciones.

///////////////////////////////////////////////////////////////////////////////
// Scoreboar: Este bloque se encarga de comparar lo recibido con lo esperado //
///////////////////////////////////////////////////////////////////////////////

`uvm_analysis_imp_decl(_p_drvr)
`uvm_analysis_imp_decl(_p_mntr)

`include "debug_signal_detector.sv"

class scoreboard extends uvm_scoreboard #(item);
  `uvm_component_utils(scoreboard)
  parameter ROWS = 4;
  parameter COLUMS = 4;
  parameter pckg_sz = 40;
  parameter fifo_depth = 8;

  //ruta
  int r;
  int c;
  int rr;
  int cc;
  // arreglos
  item arreglo_sc[longint];
  item arreglo_mnt[longint];
  item s_item;
  virtual bus_mesh_if #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz),.fifo_depth(fifo_depth)) vif;
  
  uvm_analysis_imp_p_drvr#(item,scoreboard) d_analysis_imp;
  uvm_analysis_imp_p_mntr#(item,scoreboard) m_analysis_imp;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name,parent);
    m_analysis_imp = new("m_analysis_imp",this);
    d_analysis_imp = new("d_analysis_imp",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
     phase.raise_objection(this);
    /*fork
      `trayectoria
    join_none*/
    `uvm_warning("Se inicializó el scoreboard", get_type_name())
     phase.drop_objection(this);
    
  endtask
  
  virtual function void write_p_drvr (input item s_item);
	//paquete = {s_item.Next_jump, s_item.d_fila, s_item.d_columna, s_item.modo, s_item.f_fila, s_item.f_columna, s_item.dato};
    //arreglo_sc.push_back(s_item);
    arreglo_sc[{s_item.paquete}] = s_item;
    golden_reference(s_item);
    /*
    foreach (arreglo_sc[i]) begin
      $display("Arreglo driver: %h",arreglo_sc[i].dato);
    end*/
    
  endfunction
  
  function write_p_mntr(input item s_item);
    arreglo_mnt[{s_item.paquete}] = s_item;
   
        /*foreach (arreglo_mnt[i]) begin
          $display("Arreglo monitor: %h",arreglo_mnt[i].out[pckg_sz-26:0]);
    end*/
    /*foreach (arreglo_sc[i]) begin
      $display("------%h",arreglo_sc[i].dato);
      $display("xxxxxx%h",arreglo_mnt[i].out[pckg_sz-26:0]);
      
      if (arreglo_sc.size()) begin
        if(arreglo_sc[i].dato == arreglo_mnt[i].out[pckg_sz-26:0])
          uvm_report_info(get_type_name(), $sformatf("Paquete enviado %h y paquete recibido %h es el mismo",arreglo_sc[i].dato,arreglo_mnt[i].out[pckg_sz-26:0]), UVM_LOW);
        else
          uvm_report_error(get_type_name(), $sformatf("Paquete enviado %h y paquete recibido %h es distinto",arreglo_sc[i].dato,arreglo_mnt[i].out[pckg_sz-26:0]), UVM_LOW);
      end
      else
        uvm_report_error(get_type_name(), $psprintf("No hay paquetes que comparar"), UVM_LOW);
    end*/
  endfunction

    virtual function void check_phase(uvm_phase phase);
      super.check_phase(phase);
      
	  $display("Cantidad de datos iniciales [%0d]",arreglo_mnt.size());
      foreach(arreglo_mnt[i])begin
        arreglo_sc.delete(i);
      end
      $display("Datos finales [%0d]",arreglo_sc.size());
      foreach(arreglo_sc[i])begin
        $display("El dato [%b] no llegó al destino", i);
      end
    endfunction
  
  task golden_reference(item s_item);
     r = s_item.f_fila;
      c = s_item.f_columna;
      if(r == 0) r = 1;
      if(c == 0) c = 1;
      if(r == 5) r = 4;
      if(c == 5) c = 4;
    case(s_item.modo) // Hace un case del modo fila 1ero o columna 1ero
      0:begin
          if(((s_item.f_fila <=s_item.d_fila))&(s_item.listo !=1)) begin
            if((s_item.f_columna <= s_item.d_columna)&(s_item.listo !=1))begin
              
              rr = r;
              cc = c;
              while((cc< s_item.d_columna)&(cc<4))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                cc++;
                s_item.trayectoria[rr][cc] = 1;
               end
              while((rr< s_item.d_fila)&(rr<4))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                rr++;
                s_item.trayectoria[rr][cc] = 1;
              end
          	end
          	else begin
              rr = r;
              cc = c;
              while((cc > s_item.d_columna)&(cc>=2))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                cc--;
                s_item.trayectoria[rr][cc] = 1;
               end
              while(rr < s_item.d_fila)begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                rr++;
                s_item.trayectoria[rr][cc] = 1;
              end
            end
          end
          if(((s_item.f_fila >= s_item.d_fila))&(s_item.listo !=1)) begin
            if((s_item.f_columna <= s_item.d_columna)&(s_item.listo !=1))begin
              rr = r;
              cc = c;
              while((cc< s_item.d_columna)&(cc<=3))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                cc++;
                s_item.trayectoria[rr][cc] = 1;
              end
              while((rr> s_item.d_fila)&(rr>=2))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                rr--;
                s_item.trayectoria[rr][cc] = 1;
               end
          	end
          	else begin
              rr = r;
              cc = c;
              while((cc > s_item.d_columna)&(cc>1))begin

                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                cc--;
                s_item.trayectoria[rr][cc] = 1;
               end
              while((rr > s_item.d_fila)&(rr>=1))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                rr--;
                s_item.trayectoria[rr][cc] = 1;
              end
            end
          end
        end
        1:begin
          if(((s_item.f_fila <=s_item.d_fila))&(s_item.listo !=1)) begin
            if((s_item.f_columna <= s_item.d_columna)&(s_item.listo !=1))begin
              rr = r;
              cc = c;
              while((rr< s_item.d_fila)&(rr<=3))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                rr++;
                s_item.trayectoria[rr][cc] = 1;
              end
              while((cc< s_item.d_columna)&(cc<=3))begin
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                cc++;
                s_item.trayectoria[rr][cc] = 1;
               end
          	end
          	else begin
              rr = r;
              cc = c;
              while((rr< s_item.d_fila)&(rr<=3))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                rr++;
                s_item.trayectoria[rr][cc] = 1;
               end
              while(cc > s_item.d_columna)begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                cc--;
                s_item.trayectoria[rr][cc] = 1;
              end
            end
          end
          
          if(((s_item.f_fila >= s_item.d_fila))&(s_item.listo !=1)) begin
            if((s_item.f_columna <= s_item.d_columna)&(s_item.listo !=1))begin
              rr = r;
              cc = c;
              while((rr> s_item.d_fila)&(rr>=2))begin
                s_item.listo = 1;
                s_item.trayectoria[rr][cc] = 1;
                s_item.salto =s_item.salto +1;
                rr--;
                s_item.trayectoria[rr][cc] = 1;
               end
              while((cc< s_item.d_columna)&(cc<=3))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                cc++;
                s_item.trayectoria[rr][cc] = 1;
              end
          	end
          	else begin
              rr = r;
              cc = c;
              while((rr > s_item.d_fila)&(rr>1))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                rr--;
                s_item.trayectoria[rr][cc] = 1;
               end
              while((cc > s_item.d_columna)&(cc>=1))begin
                s_item.trayectoria[rr][cc] = 1;
                s_item.listo = 1;
                s_item.salto =s_item.salto +1;
                s_item.trayectoria[rr][cc] = 1;
                cc--;
                s_item.trayectoria[rr][cc] = 1;
              end
            end
          end
        end
    endcase
    /*
    $display("Ruta scoreboard: fuente: [%0d][%0d], destino: [%0d][%0d] en modo: %d",s_item.f_fila,s_item.f_columna, s_item.d_fila, s_item.d_columna, s_item.modo);
    $display("saltos: ", s_item.salto);
    for (int i = 0; i <=5 ; i++)begin
      for (int j = 0; j <= 5; j++) begin
        if(s_item.trayectoria[i][j]==1)$display("ruta [%0d][%0d]",i,j);
      end
    end*/
  endtask

  
  /*virtual function void report();
        uvm_report_info(get_type_name(),
        $psprintf("Scoreboard Report \n", this.sprint()), UVM_MEDIUM);
   endfunction */
  

endclass
