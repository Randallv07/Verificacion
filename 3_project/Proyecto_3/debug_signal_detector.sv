 	// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Interface

////////////////////////////////////////////////////////////////
//Interface Debug:  //
////////////////////////////////////////////////////////////////

 // Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Diseño de pruebas en capas para un BUS mesh de datos
// Modulo: Interface

///////////////////////////////////////////
//Interface Debug: revisa bandera en dut //
///////////////////////////////////////////

 /*
`define  trayectoria\
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \   
           end \ 
       end \ 
       begin \ 
           forever begin \ 
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \ 
               arreglo_sc [tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \ 
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \     
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \ 
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \              
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \ 
           end \
       end \
	   
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \  
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \  
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \        
           end \
       end \
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \  
           end \
       end \
	   
	   
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
              
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
       begin \
           forever begin \
               @(posedge tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
               arreglo_sc[tb.dut_wrap.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[pckg_sz-9:0]].trayectoria[1][1] = -1; \
               
               
           end \
       end \
     
*/