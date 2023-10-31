module det_1011 (input clk, input rstn, input in, output out );

  parameter IDLE = 0, // Estado 0 
             S1  = 1, //Estado 1
             S10 = 2, // Estado 2
            S101 = 3, // Estado 3
           S1011 = 4;  // Estado 4 Indica que la secuencia está completa 

  reg[2:0] cur_state, next_state; //Estado actual y estado siguiente 

  assign out = S1011 ? 1: 0; //Si el parametro S1011 esta en alto out = 1 si S1011

  always@(posedge clk) begin
    if(!rstn) begin //Reset se activa en bajo
      cur_state <= IDLE;
    end else begin
      cur_state <= next_state;
    end
  end

  always@(cur_state or in) begin
    case(cur_state)
      IDLE: begin
        next_state <= in ? S1 : IDLE;
      end
    
      S1: begin
        next_state <= in ? S1 : S10;
      end
     
      S10: begin
        next_state <= in ? S101 : IDLE; 
      end

      S101: begin
        next_state <= in ? S1011 : S10; 
      end

      S1011: begin
        next_state <= in ? S1 : S10; 
      end    
    endcase
  end
endmodule