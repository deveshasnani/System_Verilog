//`include "packet.sv"
//`include "interface.sv"
class master_driver;
  
 virtual  master_interface intf;
  mailbox #(packet) drv2sb;
  packet pkt;
  
  
  function new(virtual  master_interface intf,mailbox #(packet) drv2sb);
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
    @ (negedge intf.clk) intf.start = 1;  
    repeat(8) @(posedge intf.clk);
    
    for(int x = no_of_bytes;x>=0;x++) begin
      if(intf.mode == 1) begin
        pkt.data = $random;
        intf.din = pkt.data;
        drv2sb.put(pkt);
        	if(x == 0) intf.stop = 1;
        else intf.stop = 0;
        repeat (8)  @(negedge intf.clk);
      end
      
      if(intf.mode == 0) begin
        if(x == 0) intf.stop = 1;
        else intf.stop = 0;
        repeat (8)  @ (negedge intf.clk);
         pkt.data = intf.dout;
        drv2sb.put(pkt);
      end
      
    end
    
  endtask
  
endclass


/////////////////////////////////////SLAVE DRV//////////////////////////

class slave_driver;
  
virtual  slave_interface intf;
  mailbox #(packet) drv2sb;
  packet pkt;
  
  
  function new(virtual  slave_interface intf,mailbox #(packet) drv2sb);
    $display("slave DRIVER CONSTRUCTOR");
    this.intf = intf;
    this.drv2sb = drv2sb;
    pkt = new();
  endfunction
  
  task start(int no_of_bytes);
    $display("DRIVER START Slave");
    intf.address = pkt.address;
    intf.din = pkt.data;
    repeat (8) @(posedge intf.clk);
    
    repeat(no_of_bytes) begin
      if(pkt.mode == 1) begin //receiver mode
        repeat(8) @(negedge intf.clk);
        pkt.data = intf.dout;
        drv2sb.put(pkt);
      end
      
      if (pkt.mode == 0) begin
       pkt.data = $random;
        intf.din = pkt.data;
        drv2sb.put(pkt);
         repeat(8) @(negedge intf.clk);
      end
    end
            
  endtask
  
endclass// address and data phase different