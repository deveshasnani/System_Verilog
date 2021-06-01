`include "interface.sv"
`include "i2c_slave.sv"
`include "i2c_master.sv"
`include "testcase.sv"
module top;
  
  master_interface mintf();
  slave_interface sintf();
      
  testcase t1(mintf,sintf);
  wire SDA,SCL;
  pullup(SDA);
  pullup(SCL);
  reg clk = 0;
  always #40 clk = ~clk;
  assign mintf.clk = clk;
  assign sintf.clk = clk;
 // assign mintf.SDA = SDA;
 // assign mintf.SCL = SCL;
 // assign sintf.SDA = SDA;
 // assign sintf.SCL = SCL;
  initial $dumpvars();
  i2c_master master(.SDA(SDA),
                    .SCL(SCL),
                    .reset(mintf.reset),
                    .din(mintf.din),
                    .address(mintf.address),
                    .dout(mintf.dout),
                    .start(mintf.start),
                    .stop(mintf.stop),
                    .rd_wr(mintf.mode),
                    .clk(clk)
                   );
  i2c_slave slave(.SDA(SDA),
                  .SCL(SCL),
                  .reset(sintf.reset),
                  .din(sintf.din),
                  .address(sintf.address),
                  .dout(sintf.dout)
                    );
  
endmodule