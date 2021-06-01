interface master_interface ();
  
  logic SCL,SDA;
  logic [7:0] din ,dout;
  logic [6:0] address;
  logic clk,reset,start,stop,mode;
  
endinterface

interface slave_interface ();
  
  logic SCL,SDA;
  logic [7:0] din,dout;
  logic [6:0] address;
  logic reset,clk;
  
endinterface
//connect address of both interfaces at top