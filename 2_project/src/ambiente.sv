`include "Driver.sv"
`include "monitor.sv"
`include "agente.sv"
`include "debug_signal_detector.sv"
`include "scoreboard.sv"
`include "checker.sv"
`include "Generador.sv"




class Ambiente  #(parameter ROWS = 4, parameter COLUMS = 4, parameter pckg_sz = 40, parameter fifo_depth = 4, parameter drvrs = ROWS*2 + COLUMS*2);

	//////////////
	//Instancias//
	//////////////
	
    //modulos
  
    Driver #(.drvrs(drvrs), .ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth)) driver_amb [drvrs];
    monitor #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth)) monitor_amb [drvrs];
  	Agente #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth), .drvrs(drvrs)) agente_amb;
    Generador #(.drvrs(drvrs), .pckg_sz(pckg_sz)) generador_amb;
  	debug_signal_detector #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz),.fifo_depth(fifo_depth)) debug_signal_detector_amb;
  scoreboard #(.pckg_sz(pckg_sz)) scoreboard_amb;
  checker #(.pckg_sz(pckg_sz)) checker_amb;
  


	//mailbox
    agent_driver_mb #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz)) agent_driver_mb_amb [drvrs];
    gen_agent_mb gen_agent_mb_amb;
    test_gen_mb test_gen_mb_amb;
  	detector_checker_mb detector_checker_mb_amb;
    driver_scoreboard_mb  driver_scoreboard_mb_amb;
    scoreboard_checker_mb #(.pckg_sz(pckg_sz)) scoreboard_checker_mb_amb;
    monitor_checker_mb monitor_checker_mb_amb;
  

    function new();
        //Inicialización de mailbox
        for(int i = 0; i < drvrs; i++) begin
            automatic int k = i;
            this.agent_driver_mb_amb[k] = new();
	    end
		this.gen_agent_mb_amb = new();
  		this.test_gen_mb_amb = new ();
      	this.detector_checker_mb_amb = new ();
      	this.driver_scoreboard_mb_amb = new ();
      	this.scoreboard_checker_mb_amb = new();
      	this.monitor_checker_mb_amb = new();

        //Inicialización de modulos
		this.agente_amb = new();
		this.agente_amb.gen_agent_mb_a = gen_agent_mb_amb;
      
		this.generador_amb = new();
		this.generador_amb.gen_agent_mb_g = gen_agent_mb_amb;
		this.generador_amb.test_gen_mb_g = test_gen_mb_amb;
      
      	this.debug_signal_detector_amb = new();
      	//this.debug_signal_detector_amb.vif = vif;
      	this.debug_signal_detector_amb.detector_checker_mb = detector_checker_mb_amb;
      
      	this.scoreboard_amb = new();
      	this.scoreboard_amb.driver_scoreboard_mb_sc = driver_scoreboard_mb_amb;
      this.scoreboard_amb.scoreboard_checker_mb_sc = scoreboard_checker_mb_amb;
      
      	this.checker_amb = new();
      	this.checker_amb.scoreboard_checker_mb_chk = scoreboard_checker_mb_amb;
      	this.checker_amb.monitor_checker_mb_chk = monitor_checker_mb_amb;

		for (int i = 0; i<drvrs; i++ ) begin
			automatic int k = i;
			this.driver_amb[k] = new(k);
            this.driver_amb[k].agent_driver_mb_d = agent_driver_mb_amb[k];
          	this.driver_amb[k].driver_scoreboard_mb_d = driver_scoreboard_mb_amb;
            this.monitor_amb[k] = new(k);
          this.monitor_amb[k].monitor_checker_mb_mnt = monitor_checker_mb_amb;
            this.agente_amb.agent_driver_mb_a[k] = agent_driver_mb_amb[k];
        end
      
        for (int i = 0; i<COLUMS;i++)begin
          driver_amb[i].filas = 0;
          driver_amb[i].colums = i+1;
        end
        for (int i = 0; i<ROWS;i++)begin
            driver_amb[i+COLUMS].colums = 0;
            driver_amb[i+COLUMS].filas = i+1;
        end
        for (int i = 0; i<COLUMS;i++)begin
            driver_amb[i+ROWS*2].filas = ROWS+1;
            driver_amb[i+ROWS*2].colums = i+1;
        end
        for (int i = 0; i<ROWS;i++)begin
            driver_amb[i+COLUMS*3].colums = COLUMS+1;
            driver_amb[i+COLUMS*3].filas = i+1;
        end


	endfunction


	task run();
		fork
            this.agente_amb.run();
			this.generador_amb.run();
          	this.debug_signal_detector_amb.run();
          	this.scoreboard_amb.run();
          	this.checker_amb.run_scoreboard();
          	this.checker_amb.run_monitor();
            for(int i = 0; i<drvrs; i++ ) begin
                fork
              		automatic int k = i;
              		this.driver_amb[k].run();
              		this.monitor_amb[k].run();
				join_none
              //this.scoreboard_amb.run();
            end
          
        join_none
	endtask
    
    task reporte();
      checker_amb.reporte();
    endtask

	function display();
		$display("Ambiente: Drivers=%d / pckg=%d / fifo=%d",this.drvrs,this.pckg_sz,this.fifo_depth);
	endfunction


endclass