//`include "testcase.sv"
//`include "Environment.sv"


module top;
  initial $display("from top.sv");
  initial $dumpvars;
  /////////////// clk gen////////////
logic clk = 0;
  always #50 clk = ~clk;
 //////////////////////////////////
  
  msintf intf ();
 assign intf.clk = clk;
  
  testcase test(intf);
  
  
  /////////////////////////
  logic MISO,MOSI,SCLK,SS;
  master m1(.MISO(MISO),
            .start(intf.start),
            .clk(clk),
 			.SCLK(SCLK),
            .MOSI(MOSI),
            .SS(SS),
            .data(intf.masterin) );
  assign intf.masterout = m1.shiftreg;
  assign m1.mode = intf.mode;
  assign s1.mode = intf.mode;
  slave s1 (.MISO(MISO),
            .SCLK(SCLK),
            .MOSI(MOSI),
            .SS(SS),
            .data(intf.slavein) );
  assign intf.slaveout = s1.shiftreg;
endmodule
