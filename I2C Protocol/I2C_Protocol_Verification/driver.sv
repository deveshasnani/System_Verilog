//`include "packet.sv"
//`include "interface.sv"
class master_driver;
  
 virtual  master_interface intf;
  mailbox #(packet) drv2sb;
  packet pkt;
  
  
  function new(virtual  master_interface intf,mailbox #(packet) drv2sb);
    this.intf = intf;
    this.drv2sb = drv2sb;
    pkt = new();
  endfunction
  
  task start();
    assert(pkt.randomize) else $display("Packet Randomization fail");
    intf.start = 0;
    intf.address = pkt.address;
    intf.mode = pkt.mode;
    if(intf.mode == 1) intf.din = pkt.data;
    @(posedge intf.clk);
    intf.start = 1;
    for(int i = 32; i >=0 ; i--)begin
      @(posedge intf.clk);
      if(i==1) intf.stop =1;//adjust cycles to match exacctly
    end
    if (intf.mode == 0) pkt.data = intf.dout;
    drv2sb.put(pkt);
    
  endtask
  
endclass


/////////////////////////////////////SLAVE DRV//////////////////////////

class slave_driver;
  
virtual  slave_interface intf;
  mailbox #(packet) drv2sb;
  packet pkt;
  
  
  function new(virtual  slave_interface intf,mailbox #(packet) drv2sb);
    this.intf = intf;
    this.drv2sb = drv2sb;
    pkt = new();
  endfunction
  
  task start();
    assert(pkt.randomize) else $display("Packet Randomization fail");
    intf.address = pkt.address;
    intf.din = pkt.data;
    
    
    repeat(32)
      @(posedge intf.clk);//adjust cycles to match exacctly // use top.clk
    pkt.data = intf.dout;
    drv2sb.put(pkt);
           
  endtask
  
endclass// address and data phase different