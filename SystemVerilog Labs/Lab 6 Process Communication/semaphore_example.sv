module test3;
  
  class driver ;
    task send( input string str,int i);
      sem.get(1);
      $display("key TAKEN by %s %d times",str,i);
     
    endtask
    
    task receive( input string str, int i);
     sem.put(1);
      $display("RETURNED key by %s %d times",str,i);
    endtask
     
  
  endclass
  
  driver d_array[2];
  semaphore sem;
  
  initial 
    begin
      d_array[0] = new ;
      d_array[1] = new ;
      sem = new(1);
     
      
     for(int i=1;i<=10;i++)
     
     fork
    d_array[0].send("[driver 1] " ,i);
    d_array[1].send("[driver 2] ",i);
    d_array[0].receive("[driver 1] ",i);
    d_array[1].receive("[driver 2] ",i);
    join
           end
  
  
endmodule