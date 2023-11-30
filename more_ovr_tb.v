module TB;
  reg clk, rst_n, x;
  wire z;
  
  more_ovr d(clk, rst_n, x, z);
  initial clk = 0;   
  always #1 clk = ~clk;
    
  initial begin
    $monitor($time,"x = %b, z = %b", x, z);
    x = 0;
    #0 rst_n = 0;
    #2 rst_n = 1;
    
    #2 x = 1;
    #2 x = 0;
    #2 x = 1;
    #2 x = 1;
    #2 x = 0;
    #2 x = 1;
    #2 x = 1;
    #2 x = 0;
    #2 x = 1;
    #2 x = 1;
    #2 x = 0;
    #2 x = 1;
    #20;
    $finish;
  end
endmodule
