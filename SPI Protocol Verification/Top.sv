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
  
   /// assertions
  int errcount=0;
   logic [1:0] m03,m12;
  always @(negedge SCLK , negedge SS) #1 m03 = {MOSI,MISO};
  always @(posedge SCLK , negedge SS) #1 m12 = {MOSI,MISO};
  
      
   
    property p1;
       disable iff (intf.mode==0 || intf.mode==3)
     @(negedge SCLK) SS==0 && {MOSI,MISO}==m12;
    endproperty
   
   property p2;
     disable iff (intf.mode==1 || intf.mode==2)
     @(posedge SCLK) SS==0 && {MOSI,MISO}==m03;
    endproperty
 
   assert property(p1 ) else 
      	 begin
                if(errcount<=0) errcount++ ;
       			 else begin
        		 errcount++;
        		 $error("Assertion Fail");
      	 end
     end
     
     assert property(p2) else 
      	 begin
                if(errcount<=0) errcount++ ;
       			 else begin
        		 errcount++;
        		 $error("Assertion Fail");
      	 end
     end
endmodule
