module tb_top;
  import uvm_pkg::*;  //Se importa UVM pckg_sz para usar construcciones de UVM en el modulo 
  
  bit clk;
  always #10 clk <= ~clk;
  

// La interfaz se establece como un objeto en uvm_config_db (base de datos de UVM) y se recupera en la fase de prueba 
//  usando el método run_test();

  dut_if dut_if1(clk);
  dut_wrapper dut_wr0 (._if(dut_if1)) // Se coloca el dispositivo bajo prueba dentro de wrapper
  
  initial begin
    uvm_config_db #(virtual dut_if)::set(null, "uvm_test_top", "dut_if", dut_if1);
    run_test ("base_test"); // Se corre la prueba base_test en la simulacion
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd")
  end

endmodule