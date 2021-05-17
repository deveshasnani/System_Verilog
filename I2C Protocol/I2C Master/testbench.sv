
// or browse Examples
module test_i2c_master();
  
  
  
  reg clk,rd_wr,start,stop,reset;
  reg [7:0] din;
  reg [6:0] address;
  wire SDA;
  wire SCL;
  reg sda;
  wire [7:0] dout;
always #20 clk = ~ clk ;
  pullup(SCL);
  pullup(SDA);
 i2c_master m1(clk,rd_wr,start,stop,reset,address,din,SDA,SCL,dout);
  
  initial 
    begin
      sda = 1;
      din = 8'b10110101;
      
      
      clk = 0;
      address = 7'b1000110;
      rd_wr = 1;
      $dumpvars;
      
      #50
      stop = 0;
      reset = 1;
      #60
      
      reset = 0;
      #10
      start = 1;
      #50
      start = 0;
      #1000
      start = 1;
      #100
      start = 0;
      
      
      
      #2000
      $finish;
    end
  initial begin
    #860
    sda = 0;
    #80
    sda =1;
  end
      
  assign SDA = (sda == 0 ) ? 1'b0 : 1'bz ;
endmodule