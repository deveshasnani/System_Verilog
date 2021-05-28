// Code your testbench here
// or browse Examples
module master_tb;
  reg  clk, start, MISO,reset;
  reg [7:0] din;
  reg [1:0] mode;
  wire MOSI, SS, SCLK;
  
  spi_master dut(clk,start,MISO,reset,din,mode,MOSI,SS,SCLK);
  
  initial 
    begin 
      $dumpvars();
      start = 0;
      reset = 0;
      clk = 0;
      mode = 0;
      din = $random ;
      #24
      reset = 1;
      #100
      reset = 0;
      #50
      MISO = 1'b0;
      #5 
      start = 1;
      #200
      MISO = 1'b1;
      #2000
      $finish;
    end
  
  always #20 clk = ~clk;
  endmodule