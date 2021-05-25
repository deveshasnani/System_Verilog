// Code your design here
module lab3;
class account_c;
int balance ;

function int summary;
return balance;
endfunction

task deposit(input int  pay);
balance = pay + balance;
endtask

endclass


account_c myacc;

initial
  begin
myacc = new ;
myacc.deposit(1000);
    
$display("account summary -> %d" ,myacc.summary());
    
end
endmodule

module lab3_2;
class packet;
  bit [3:0] data;
  bit [15:0] addr,mem;
  
endclass

packet pkth1,pkth2;
initial
  begin
pkth1=new;
pkth1.data = $random;
pkth1.addr = $random;
pkth1.mem = $random;
    $display ("data %d 	add %d 		mem %d", pkth1.data,pkth1.addr,pkth1.mem);
pkth2 = pkth1;
pkth2.data = 7;
pkth2.addr = 98;
pkth2.mem = 502;
$display ("data %d 	add %d 		mem %d", pkth1.data,pkth1.addr,pkth1.mem);
  end
endmodule