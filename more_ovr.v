module more_ovr(input clk, rst_n, x, output z);
  parameter S0 = 4'd0;
  parameter S1 = 4'd1;
  parameter S2 = 4'd2;
  parameter S3 = 4'd3;
  parameter S4 = 4'd4;
  reg [3:0] state, next_state;
  always @(posedge clk ) begin
    if(!rst_n) state <= S0;
    else state <= next_state;end
  
  always @(state or x) begin
    case(state)
      S0: begin next_state=x?S0:S1;end     
      S1: begin next_state=x?S2:S1;end
      S2: begin next_state=x?S3:S1;end
      S3: begin next_state=x?S0:S4;end
      S4: begin next_state=x?S2:S1;end
      default: begin next_state = S0;end
    endcase
  end
  assign z=(state==S4)?1:0;
endmodule
