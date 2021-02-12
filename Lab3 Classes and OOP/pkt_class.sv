
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
pkth2 = pkth1;
pkth2.data = 7;
pkth2.addr = 98;
pkth2.mem = 502;
$display ("data %d 	add %d 		mem %d", pkth1.data,pkth1.addr,pkth1.mem);
  end
endmodule