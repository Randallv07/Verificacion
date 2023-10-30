`timescale 1ns/1ps

`include "Router_library.sv"
`include "ambiente.sv"
`include "test.sv"
`include "coverage.sv"

module testbench();

  
    initial begin
      rand_parameter pkt = new();
      pkt.size_pckg.constraint_mode(1); 
      pkt.size_fifo.constraint_mode(1); 
      pkt.size_cant_transac.constraint_mode(1); 
      pkt.randomize();
      //$display("Valor de pckg_size = %d", pkt.pckg_sz_rand);
    end
  	
  	reg clock_tb; 
	reg reset_tb;

	//Defincion de parametros

	parameter ROWS_tb = 4;
	parameter COLUMS_tb = 4;
	parameter pckg_sz_tb = 40;
	parameter fifo_depth_tb = 8;
	parameter c_fila_tb = 0;
  	parameter broadcast ={pckg_sz_tb-18{1'b1}};
	parameter c_columna_tb = 0;
	parameter drvrs_tb = ROWS_tb*2+COLUMS_tb*2;
//	trans_test_gen trans_test_gen_tb;
  test_gen_mb test_gen_mb_tb =new();
  trans_detector_checker #(.pckg_sz(pckg_sz_tb)) trans_detector_checker_tb;
  

	//Se genera dumpfile para ver señales
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,testbench);
	end

	bus_mesh_if #(.ROWS(ROWS_tb), .COLUMS(COLUMS_tb),.pckg_sz(pckg_sz_tb),.fifo_depth(fifo_depth_tb)) vif (.clk(clock_tb));
	
	// Conexión del DUT
	mesh_gnrtr #(.ROWS(ROWS_tb), .COLUMS(COLUMS_tb), .pckg_sz(pckg_sz_tb),.fifo_depth(fifo_depth_tb), .bdcst(broadcast)) DUT (
  		.clk(clock_tb),
  		.reset(vif.reset),
  		.pndng(vif.pndng),
  		.data_out(vif.data_out),
  		.popin(vif.popin),
  		.pop(vif.pop),
  		.data_out_i_in(vif.data_out_i_in),
  		.pndng_i_in(vif.pndng_i_in));
		//instacias
		Ambiente  #(.ROWS(ROWS_tb), .COLUMS(COLUMS_tb), .pckg_sz(pckg_sz_tb), .fifo_depth(fifo_depth_tb), .drvrs(drvrs_tb)) ambiente_tb;
		test #(.ROWS(ROWS_tb), .COLUMS(COLUMS_tb), .pckg_sz(pckg_sz_tb), .fifo_depth(fifo_depth_tb), .drvrs(drvrs_tb)) test_tb;
		coverage coverage_tb;

		// Generación de clock
		initial begin
			forever begin
				#5
				clock_tb = ~clock_tb;
			end
		end
	
		//Definicion de variables de inicio
		initial begin
			clock_tb = 0;
			vif.reset = reset_tb;
			reset_tb = 1;
			vif.reset = reset_tb;
			#50
			reset_tb = 0;
			vif.reset = reset_tb;
		end

		//Inicializacion ambiente
		initial begin 
			//test
			test_tb = new();
			test_tb.test_gen_mb_t = test_gen_mb_tb;
			
			//ambiente
			ambiente_tb = new();
			ambiente_tb.display();
			ambiente_tb.generador_amb.test_gen_mb_g = test_gen_mb_tb;
          	ambiente_tb.debug_signal_detector_amb.vif = vif;
          
          	//coverage
          coverage_tb = new();
			
			for (int i = 0; i < drvrs_tb; i++ ) begin
				automatic int k = i;
				ambiente_tb.driver_amb[k].fifo_in_d.vif = vif;
				ambiente_tb.monitor_amb[k].vif = vif;
			end
			
			fork
				test_tb.run();
				ambiente_tb.run();
              coverage_tb.run();
			join_none

		end
  /*
  initial begin
    forever begin
    	ambiente_tb.detector_checker_mb_amb.get(trans_detector_checker_tb);
      $display("\nPor el router [%0d] [%0d] pasa la transacción [%h]",trans_detector_checker_tb.trayec_f,trans_detector_checker_tb.trayec_c,trans_detector_checker_tb.data_out);
  		end
        
  	end*/


		initial begin
			#50000;
        	ambiente_tb.reporte();
          	coverage_tb.coverage_reporte();
			$finish;
		end
  

endmodule

