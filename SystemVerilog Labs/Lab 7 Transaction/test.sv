module ram_test;
  `include "ram_trans.sv"
  ram_trans trans;
  ram_trans trans_array[int];
  
  initial
    begin
    
    for(int i = 1;i<=10;i++)
      begin
        trans = new();
        trans.trans_id+=1;
        assert(trans.randomize()) else $display("Randomize_fail");
        trans_array[trans.trans_id]= trans;
        trans_array[i].display("packet display called");
      end
  
  $display("////////////////////// array Display ///////////////");
  
    //  for(int i = 1;i<=10;i++)
        
   
  
    end
endmodule