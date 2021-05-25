module test;
class account_c;
  int balance = 20 ;
  
  function int summary_deposit();
summary_deposit = balance;
  endfunction
  
  task deposit(input int pay);
    balance = balance + pay;
  endtask
  
endclass
  
class account_c1 extends account_c;
  int balance = 30;
 
  function int summary();
    summary = balance + super.balance;
  endfunction

endclass

initial
  begin
    account_c1 exobj=new;
    exobj.deposit(1011);
    $display("balance after deposit = %d",exobj.summary_deposit());
    $display("ext summary = %d",exobj.summary());
  end
  
endmodule