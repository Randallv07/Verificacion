`timescale 1ns/1ps

`include "sequence_item.sv"
`include "sequence.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agente.sv"
`include "ambiente.sv"
`include "test.sv"

module tb;  
  reg clk;

  always #10 clk =~ clk;

  des_if _if(clk);

  det_1011 u0 (.clk(clk), .rstn(_if.rstn), .in(_if.in), .out(_if.out));
  
  initial begin
    clk <= 0;
    uvm_config_db #(virtual des_if)::set(null, "uvm_test_top", "des_if", _if);
    run_test ("test_1011"); 
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd")
  end

endmodule