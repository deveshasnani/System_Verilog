
class scoreboard;
  logic [7:0] mpkt,spkt;
  mailbox #(logic [7:0]) sdrv2sb,mdrv2sb;
  int error = 0;
  
  function new( mailbox #(logic [7:0]) sdrv2sb, mailbox #(logic [7:0]) mdrv2sb);
    this.sdrv2sb = sdrv2sb;
    this.mdrv2sb = mdrv2sb;
    //mpkt = new();
    //spkt = new();
  endfunction
  
  task start(int no_of_bytes);
    $display ("SCOREBOARD Start_Task");
    repeat(no_of_bytes)begin
    
    sdrv2sb.get(spkt);
    mdrv2sb.get(mpkt);
  //  $display("SB before compare master data = %h , slave data = %h",mpkt,spkt);
      
      $display("COMPARE TASK");
      if(spkt == mpkt) begin
        $display("PASS [%h , %h]",mpkt,spkt);
        $display("----------------------------------------------------------------------------------------------");
      end
      else begin
        error ++;
        $display("COMPARE TASK - Fail####");
        $display("FAIL [%h , %h]",mpkt,spkt);
      end
    end
   
    $display("SB REPORT Errors = %d", error);
  endtask
  
endclass