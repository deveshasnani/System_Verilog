class ram_trans;
  rand  logic [63:0] data, data_out;
  rand logic [11:0] rd_address , wr_address;
  rand logic read , write;
  
  static int trans_id,no_of_read_trans,no_of_write_trans,no_of_RW_trans;
  
  constraint val_add {wr_address != rd_address;}
  constraint val_rdwr { {read,write} != 2'b00;}
  constraint val_data {data inside {[1:64'd4204067295]};}
  
  task display(input string message);
    $display(message);
    $display("\n data = %d \n rd_add = %d \n wr_add = %d\n read = %d \n write = %d \n transID = %d \n no_of_read_trans = %d \n no_of_write_trans= %d \n no_of_RW_trans= %d \n dataout = %d ", data,rd_address , wr_address,read , write,trans_id,no_of_read_trans,no_of_write_trans,no_of_RW_trans,data_out);
  endtask
  
  function void post_randomize();
    if({read,write}==2'b10) no_of_read_trans+=1;
    if({read,write}==2'b01) no_of_write_trans+=1;
    if({read,write}==2'b11) no_of_RW_trans+=1; 
  endfunction
  
  
endclass

