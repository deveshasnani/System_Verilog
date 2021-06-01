//`include "packet.sv"
//`include "interface.sv"
class master_driver;
  
 virtual  master_interface intf;
  mailbox #(logic [7:0]) drv2sb;
  packet pkt;
  
  
  function new(virtual  master_interface intf,mailbox #(logic [7:0]) drv2sb);
    $display("master DRIVER CONSTRUCTOR");
    this.intf = intf;
    this.drv2sb = drv2sb;
    pkt = new();
  endfunction
  
  task start(int no_of_bytes);
    $display("DRIVER START master");
    assert(pkt.randomize) else $display("Packet Randomization fail");
    intf.start = 0;
    intf.address = pkt.address;
    intf.mode = pkt.mode;
    $display ("MODE Randomized => %d",pkt.mode);
    @ (negedge intf.clk) intf.start = 1;  
    repeat(19) @(posedge intf.clk);
    intf.start = 0;
    if(intf.mode == 0) repeat (2)  @ (posedge intf.clk);
    for(int x = no_of_bytes;x>=0;x--) begin
      if(intf.mode == 1) begin
        pkt.data = $random;
        intf.din = pkt.data;
        
         
        	if(x == 0) intf.stop = 1;
        else intf.stop = 0;
               for(int t1 = 18; t1>0;t1--) begin 
                 @(negedge intf.clk);
                 if(t1==2)begin
                   drv2sb.put(intf.din);
                   $display("Master sample  data = %h   %t",intf.din,$time);
                 end
               end
        
        
        
      end
      
      if(intf.mode == 0) begin
        if(x == 0) intf.stop = 1;
        else intf.stop = 0;
        repeat (18)  @ (posedge intf.clk);
         
        drv2sb.put(intf.dout);
        $display("Master sample  data = %h   %t",intf.dout,$time);
      end
      
    end
    
  endtask
  
endclass


/////////////////////////////////////SLAVE DRV//////////////////////////

class slave_driver;
  
virtual  slave_interface intf;
  mailbox #(logic [7:0]) drv2sb;
  packet pkt;
  
  
  function new(virtual  slave_interface intf,mailbox #(logic [7:0]) drv2sb);
    $display("slave DRIVER CONSTRUCTOR");
    this.intf = intf;
    this.drv2sb = drv2sb;
    pkt = new();
  endfunction
  
  task start(int no_of_bytes);
    $display("DRIVER START Slave");
    intf.address = pkt.address;
    intf.din = pkt.data;
    
    repeat (18) @(posedge intf.clk);
    if (pkt.mode == 1)  repeat (4) @(posedge intf.clk);
    repeat(no_of_bytes) begin
      if(pkt.mode == 1) begin //receiver mode
        repeat(18) @(negedge intf.clk);
        
        drv2sb.put(intf.dout);
        $display("Slave sample   data = %h   %t",intf.dout,$time);
      end
      
      if (pkt.mode == 0) begin
       pkt.data = $random;
        intf.din = pkt.data;
        
        
        for(int t2 = 18;t2>0;t2--)begin
          if(t2 == 3) begin
            drv2sb.put(intf.din);
            $display("Slave sample   data = %h   %t",intf.din,$time);
          end
          @(posedge intf.clk);
          
        end
      end
    end
            
  endtask
  
endclass// address and data phase different