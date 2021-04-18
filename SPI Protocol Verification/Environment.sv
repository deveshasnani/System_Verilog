
//`include "scoreboard.sv"
//`include "Driver.sv"

class environment;
  virtual msintf intf ;
  mailbox #(logic [ 7:0])drv2sb,mon2sb;
   scoreboard sb;
  master_driver mdrv;
  slave_driver sdrv;
  
  function new(virtual msintf intf );
    $display("environment constructor");
         this.intf =intf;
           endfunction
      
      function build();
        $display("environment build_fn"); 
      drv2sb = new();
      mon2sb = new();
          mdrv = new(drv2sb,intf);
          sdrv = new(mon2sb,intf);
          sb = new(drv2sb,mon2sb,intf);
      endfunction
          
  task reset();
    
    
    
  endtask
  
          task start();
            $display("environment start task");
            sdrv.start_tx(); 
            mdrv.start_tx();
            sb.start();
            
          endtask
endclass
