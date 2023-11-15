module dut_wrapper (bus_mesh_if bus_wrapper);
    mesh_gnrtr DUT(.clk(bus_wrapper.clk), .reset(bus_wrapper.reset), 
    .pndng(bus_wrapper.pndng), .data_out(bus_wrapper.data_out), 
    .pop(bus_wrapper.pop), .data_out_i_in(bus_wrapper.data_out_i_in), 
    .pndng_i_in(bus_wrapper.pndng_i_in));
    
endmodule