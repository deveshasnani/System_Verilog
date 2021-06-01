class packet;
  
  rand static bit [6:0] address;
  rand  bit [7:0] data;
  rand static bit mode ;
  bit error;
  task display();
    $display("Address => %d \n Data => %d \n Mode => %d",address,data,mode);
  endtask
  
  task compare(packet pkt1);
    $display("PACKET Compare_Task %t",$time);
    //$display("Address1 = %h Address2 = %h",this.address,pkt1.address);
    $display("Data1 = %h Data2 = %h",this.data,pkt1.data);
    if(this.address != address) begin 
      $display("address mismatch");
      error = 1;
    end
    if(this.data != pkt1.data) begin 
      $display("data mismatch");
      error = 1;
    end
    
    //if (error==1) root.errorcount++; 
    error = 0;
    
  endtask
  
endclass