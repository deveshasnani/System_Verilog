class master_driver;
   // gen clk in env
  
  logic [7:0] word;
  mailbox #(logic [7:0]) drv2sb;
  
  virtual msintf dintf;
  
  function new (mailbox #(logic [7:0]) drv2sb, virtual msintf dintf );
   
    this.drv2sb = drv2sb;
      this.dintf = dintf;
     
      endfunction
    
    task start_tx();
      
        dintf.start = 0;
      @ (negedge dintf.clk);
      word = $random;
      $display("master_driver start_tx task ## masterin = %h",word);
        dintf.masterin <= word;
        drv2sb.put(word);
      @(posedge dintf.clk);
        dintf.start = 1;
      repeat(9) @(posedge dintf.clk);
        
        
    endtask
      
    
  
  
endclass


      
class slave_driver;
   // gen clk in env
  
  rand logic [7:0] word;
  mailbox #(logic [7:0]) mon2sb;
  
  virtual msintf sintf;
  
  function new (mailbox #(logic [7:0]) mon2sb, virtual msintf sintf );
    
    this.mon2sb = mon2sb;
      this.sintf = sintf;
      
     
  endfunction
    
  task start_tx();
    
         word = $random;
    $display("slave_driver start_tx task ## slavein = %h",word);
        sintf.slavein = word;
        mon2sb.put(word);       
        
  endtask
      
    
  
  
  
endclass
