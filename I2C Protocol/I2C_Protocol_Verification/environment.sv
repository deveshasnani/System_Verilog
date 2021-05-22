
`include "driver.sv"
`include "scoreboard.sv"
class environment ;
  slave_driver sdrv;
  master_driver mdrv;
  virtual master_interface mintf;
  virtual slave_interface sintf;
  mailbox #(packet) mdrv2sb , sdrv2sb;
  scoreboard sb;
  
  function new(virtual master_interface mintf,  virtual slave_interface sintf);
    this.mintf = mintf;
    this.sintf = sintf;
  endfunction
  
  function build();
    mdrv2sb = new();
    sdrv2sb = new();
    
    sdrv = new(sintf,sdrv2sb);
    mdrv = new(mintf,mdrv2sb);

    sb = new(sdrv2sb,mdrv2sb);
  endfunction
  
  task reset ();
    @(posedge mintf.clk);
    mintf.reset = 1;
    @(posedge mintf.clk);
    @(posedge mintf.clk);
    mintf.reset = 0;
  endtask
  
  task start();
    
      mdrv.start();
      sdrv.start();
    
      sb.start();
  endtask
  
endclass