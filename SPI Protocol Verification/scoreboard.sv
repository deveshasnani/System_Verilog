
class scoreboard;
  mailbox #(logic[7:0]) drv2sb,mon2sb;
  
  virtual msintf intf;
  
  function new(mailbox #(logic[7:0]) drv2sb, mailbox #(logic[7:0]) mon2sb,virtual msintf intf);
  
    this.drv2sb = drv2sb;
    this.mon2sb = mon2sb;
    this.intf = intf;
    endfunction
  
    task start ( );
      $display("SCOREBOARD Check started");
      drv2sb.get(intf.masterin);
      mon2sb.get(intf.slavein);
      if(intf.masterin == intf.slaveout) $display("master to slave success");
      else $display("FAIL 		##### master to slave fail ## %h != %b",intf.masterin,intf.slaveout);
      
      if(intf.slavein == intf.masterout) $display("slave to master success");
      else $display("FAIL 		##### slave to master fail ## %h != %b",intf.slavein,intf.masterout);
      
    endtask
endclass
