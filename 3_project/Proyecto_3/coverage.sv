// coverage
// Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
// Escuela de Ingeniería Electrónica
// Prof: Ing. Ronny Garcia Ramirez. (rgarcia@tec.ac.cr)
// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en SystemVerilog
// Propósito General: Revisa los puertos de cobertura.
// Modulo: infraestructura necesarias para crear a nalizar cobertura en puertos

//////////////////////////////////////////////////////////////////////////
// coverage: este módulo es el encargado de analiza puntos de covertura //
//////////////////////////////////////////////////////////////////////////

class coverage #(parameter pckg_sz = 40);
  
  covergroup pop; //Covertura en dispositivos
    coverpoint testbench.DUT.pop[0] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[1] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[2] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[3] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[4] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[5] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[6] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[7] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[8] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[9] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[10] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[11] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[12] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[13] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[14] {bins b_pop = {1};}
    coverpoint testbench.DUT.pop[15] {bins b_pop = {1};}
  endgroup
      

  
    covergroup modo; //Covertura en modo
      coverpoint testbench.DUT.data_out_i_in[0][pckg_sz-17];
      coverpoint testbench.DUT.data_out_i_in[1] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[2] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[3] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[4] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[5] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[6] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[7] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[8] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[9] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[10] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[11] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[12] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[13] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[14] [pckg_sz-17];
    coverpoint testbench.DUT.data_out_i_in[15] [pckg_sz-17];
  endgroup

  	covergroup switch; //Covertura en routers
      coverpoint testbench.DUT._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop = {1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop= {1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop {bins i_pop ={1};} 
      coverpoint testbench.DUT._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop {bins i_pop ={1};}
	endgroup

covergroup fila_d; //Covertura en fila destino
  coverpoint testbench.DUT.data_out_i_in[0] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[1] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[2] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[3] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[4] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[5] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[6] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[7] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[8] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[9] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[10] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[11] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[12] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[13] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[14] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  coverpoint testbench.DUT.data_out_i_in[15] [pckg_sz-9:pckg_sz-12] {bins f []= {0,1,2,3,4,5};}
  endgroup 



   covergroup columna_d; //Covertura en columna destino
      coverpoint testbench.DUT.data_out_i_in[0] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out_i_in[1] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[2] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[3] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[4] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[5] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[6] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[7] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[8] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[9] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[10] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[11] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[12] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[13] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[14] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out_i_in[15] [pckg_sz-13:pckg_sz-16] {bins c []= {0,1,2,3,4,5};}
  endgroup
  
  covergroup fila_f; //Covertura en fila fuente
      coverpoint testbench.DUT.data_out[0] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[1] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[2] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[3] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[4] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[5] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[6] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[7] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[8] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[9] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[10] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[11] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[12] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[13] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[14] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[15] [pckg_sz-18:pckg_sz-21] {bins c []= {0,1,2,3,4,5};}
  endgroup 



   covergroup columna_f; //Covertura en columna fuente
      coverpoint testbench.DUT.data_out[0] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
      coverpoint testbench.DUT.data_out[1] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[2] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[3] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[4] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[5] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[6] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[7] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[8] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[9] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[10] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[11] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[12] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[13] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[14] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
    coverpoint testbench.DUT.data_out[15] [pckg_sz-22:pckg_sz-25] {bins c []= {0,1,2,3,4,5};}
  endgroup

  function new();
    pop = new();
    modo = new();
    switch = new();
    fila_d = new();
    columna_d = new();
    fila_f = new();
    columna_f = new();
  endfunction
  
  task run();
    forever begin
      #5
      pop.sample;
      modo.sample;
      switch.sample;
      fila_d.sample;
      columna_d.sample;
      fila_f.sample;
      columna_f.sample;
    end
  endtask
  
  function coverage_reporte(); // Reporte
    $display("Cobertura pop DUT devices = %0.2f %%", pop.get_coverage());
    $display("Cobertura modo = %0.2f %%", modo.get_coverage());
    $display("Cobertura switch = %0.2f %%", switch.get_coverage());
    $display("[Destino] Cobertura fila = %0.2f %% y  cobertura columna = %0.2f %%", fila_d.get_coverage(), columna_d.get_coverage());
    $display("[Fuente] Cobertura fila = %0.2f %% y  cobertura columna = %0.2f %%", fila_f.get_coverage(), columna_f.get_coverage());
  endfunction
  
endclass