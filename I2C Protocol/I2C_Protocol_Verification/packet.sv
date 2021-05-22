class packet;
  
  rand bit [6:0] address;
  rand  bit [7:0] data;
  rand bit mode ;
  bit error;
  task display();
    $display("Address => %d \n Data => %d \n Mode => %d",address,data,mode);
  endtask
  
  task compare(packet pkt);
    if(this.address != address) begin 
      $display("address mismatch");
      error = 1;
    end
    if(this.data != data) begin 
      $display("data mismatch");
      error = 1;
    end
    //if (error==1) root.errorcount++; 
    error = 0;
    
  endtask
  
endclass