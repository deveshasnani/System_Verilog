
class scoreboard;
  packet mpkt,spkt;
  mailbox #(packet) sdrv2sb,mdrv2sb;
  
  function new( mailbox #(packet) sdrv2sb, mailbox #(packet) mdrv2sb);
    this.sdrv2sb = sdrv2sb;
    this.mdrv2sb = mdrv2sb;
    mpkt = new();
    spkt = new();
  endfunction
  
  task start();
    $display ("SCOREBOARD Start_Task");
    assert(sdrv2sb.get(spkt)) else $error("Mailbox.get_fail");
    assert(mdrv2sb.get(mpkt)) else $error("Mailbox.get_fail");
    
    mpkt.compare(spkt);
    
  endtask
  
endclass