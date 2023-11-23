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