module melay_non_over(input clk, rst_n, x, output reg z);
  parameter S0 = 4'h0;
  parameter S1 = 4'h1;
  parameter S2 = 4'h2;
  parameter S3 = 4'h3;
  reg [3:0] state, next_state;
  always @(posedge clk ) begin
    if(!rst_n) state <= S0;
    else state <= next_state;
   end
  
  always @(state or x) begin
    case(state)
      S0: begin next_state <= x?S0:S1; z<=x?0:0;end
      S1: begin next_state <= x?S2:S1; z<=x?0:0;end
      S2: begin next_state <= x?S3:S1; z<=x?0:0;end
      S3: begin next_state <= x?S0:S0; z<=x?0:1;end
      default: begin next_state <= S0; z <=1'b0;end
    endcase
  end
  endmodule 
