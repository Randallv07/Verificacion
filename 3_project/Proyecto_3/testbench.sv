`include "uvm_macros.svh"
import uvm_pkg::*;
import test::*;
`include "Router_library.sv"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "Driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agente.sv"
`include "ambiente.sv"
`include "test.sv"

module tb;	

	bit clk_tb;

	always #5 clk_tb= ~clk_tb;
	bus_mesh_if _vif(clk_tb);

	dut_wrapper dut_wrapper(.)


	
    //Se genera dumpfile para ver señales
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,testbench);
	end

	mesh_gnrtr #(.ROWS(ROWS_tb), .COLUMS(COLUMS_tb), .pckg_sz(pckg_sz_tb),.fifo_depth(fifo_depth_tb), .bdcst(broadcast)) DUT (
  		.clk(clk),
  		.reset(_vif.reset),
  		.pndng(_vif.pndng),
  		.data_out(_vif.data_out),
  		.popin(_vif.popin),
  		.pop(_vif.pop),
  		.data_out_i_in(_vif.data_out_i_in),
  		.pndng_i_in(_vif.pndng_i_in));

	initial begin
		clk <= 0;
		uvm_config_db#(virtual bus_mesh_if)::set(null,"uvm_test_top","bus_mesh_if",_vif);
		run_test("test");
	end
	
endmodule
