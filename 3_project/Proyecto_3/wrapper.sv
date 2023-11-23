// Estudiantes: -Enmanuel Araya Esquivel. (emanuelarayaesq@gmail.com)
//              -Randall Vargas Chaves. (randallv07@gmail.com)
// Curso: EL-5511 Verificación funcional de circuitos integrados
// Este Script esta estructurado en System Verilog
// Propósito General: Acomoda los sequence items que se evian
// Modulo: Sequence

//////////////////////////////////////////////////////////
// wrapper: Ayuda para conectar la interface con el DUT //
//////////////////////////////////////////////////////////
module dut_wrapper (bus_mesh_if vif);
  mesh_gnrtr DUT (
  .clk(vif.clk),
  .reset(vif.reset),
  .pndng(vif.pndng),
  .data_out(vif.data_out),
  .popin(vif.popin),
  .pop(vif.pop),
  .data_out_i_in(vif.data_out_i_in),
  .pndng_i_in(vif.pndng_i_in)
);
endmodule