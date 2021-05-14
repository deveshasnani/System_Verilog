// Code your testbench here
// or browse Examples
module i2c_slave_test;
  
  wire SDA,SCL;
  pullup (SDA);
  pullup (SCL);
  reg sda , scl,reset;
  reg [7:0] din;
  wire [7:0] dout;
  reg [6:0] address;
  reg tempclk;
  always #40 tempclk = ~tempclk;
  i2c_slave s1(SDA,SCL,reset,din,address,dout);
  initial 
    begin
      $dumpvars;
      tempclk = 0;
      sda = 1;
      scl = 1;
      reset = 1;
      #30
      reset = 0;
      address = 7'b1111000;
      din = 8'b 10110011;
      
      #20
      sda = 0;
      #20
      
      scl = 0;
      sda = 1;
      #20
      scl = 1; // capture1
      #20
      
      scl = 0;
      sda = 1;
      #20
      scl = 1; // capture2
      #20
      
      scl = 0;
      sda = 1;
      #20
      scl = 1; // capture3
      #20
      
      scl = 0;
      sda = 1;
      #20
      scl = 1; // capture4
      #20
      
      scl = 0;
      sda = 0;
      #20
      scl = 1; // capture5
      #20
      
      scl = 0;
      sda = 0;
      #20
      scl = 1; // capture6
      #20
      
      scl = 0;
      sda = 0;
      #20
      scl = 1; // capture7
      #20
      
      scl = 0;
      sda = 1; /// d_wr bit
      #20
      scl = 1; // capture8
      #20
      scl = 0;
      sda = 1;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 0;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 1;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 0;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 1;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 1;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 1;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 0;
      scl = 0;
      #20
      scl = 1;
      #20
      sda = 1;
      scl = 0;
      #20
      scl = 1;
      #20
      scl = 0;
      #20
      scl = 1;
      #20 
      scl = 0;
      sda = 0;
      #20 
      scl = 1;
      #20
      sda = 1;
     #20
      scl = 0;
      #20
      scl = 1;
      
      
      
      #1000
      $finish;
      
      
      
    end
  
  assign SDA = (sda == 1) ? 1'bz : 1'b0;
  assign SCL = (scl == 1) ? 1'bz : 1'b0;
  
endmodule