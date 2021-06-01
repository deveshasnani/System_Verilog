
`include "driver.sv"
`include "scoreboard.sv"
class environment ;
  slave_driver sdrv;
  master_driver mdrv;
  virtual master_interface mintf;
  virtual slave_interface sintf;
  mailbox #(logic [7:0]) mdrv2sb , sdrv2sb;
  scoreboard sb;
  
  function new(virtual master_interface mintf,  virtual slave_interface sintf);
    this.mintf = mintf;
    this.sintf = sintf;
  endfunction
  
  function build();
    $display("ENVIRONMENT Build");
    mdrv2sb = new();
    sdrv2sb = new();
    
    sdrv = new(sintf,sdrv2sb);
    mdrv = new(mintf,mdrv2sb);

    sb = new(sdrv2sb,mdrv2sb);
  endfunction
  
  task reset ();
    $display("ENVIRONMENT RESET");
    @(posedge mintf.clk);
    mintf.reset = 1;
    sintf.reset = 1;
    @(posedge mintf.clk);
    @(posedge mintf.clk);
    mintf.reset = 0;
    sintf.reset = 0;
  endtask
  
  task start(int no_of_bytes);
    fork
    $display("ENVIRONMENT START");
      mdrv.start(no_of_bytes);
      sdrv.start(no_of_bytes);
     sb.start(no_of_bytes);
    
      join
   
  endtask
  
endclass