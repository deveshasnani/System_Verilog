// Code your testbench here
// or browse Examples
module testfifo();
  
  reg clk,reset,rd_wr,en;
  reg [7:0] din;
  wire  empty,full;
  wire [7:0] dout;
  
  fifo f1(clk,reset,rd_wr,en,din,empty,full,dout);
  
  initial begin
    $dumpvars();
    {clk,reset,rd_wr,en,din} = 12'b0000_00000000;
    
    #50 
    en =1;
    reset = 1;
    
    #40 reset = 0;
    #20
    rd_wr = 1;
    din = $random;
    #40
    din = $random;
    #40
    din = $random;
    #40
    din = $random;
    #40
    din = $random;
    #40
    din = $random;
    #3000
    rd_wr = 0;
    #1000
    $finish;
  end
  
  always # 20 clk = ~clk;
endmodule