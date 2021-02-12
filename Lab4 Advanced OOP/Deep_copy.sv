// Code your design here
module deepcopy;
class parity_calc_c;
bit [7:0] parity;
function parity_calc_c copy();
copy = new;
copy.parity = this.parity; 
return copy;
endfunction

endclass

class packet_c;
bit [7:0] header = 8'haa;
  bit [7:0] data = 8'h0c;
  parity_calc_c pkt_parity= new() ;
  
function packet_c copy();
copy = new;
copy.header = this.header;
copy.data = this.data;
  copy.pkt_parity = this.pkt_parity.copy();
//copy.pkt_parity = this.pkt_parity; // is wrong

endfunction

task display();
  $display("header = %d  data=%d  packet = %p",this.header,this.data,this.pkt_parity);
endtask
endclass



initial
begin
packet_c pkt_h1, pkt_h2,pkt_h3,pkt_h4;
pkt_h1 = new;
pkt_h2 = new pkt_h1;
  $display("H1 %p",pkt_h1);
  $display("H2 %p",pkt_h2);
  
  pkt_h2.header = 124;
  $display("H1 %p",pkt_h1);
  $display("H2 %p",pkt_h2);
  
  pkt_h2.pkt_parity.parity = 51;
  $display("H1 %p",pkt_h1);
  $display("H2 %p",pkt_h2);
  $display("%d , %d ",pkt_h1.pkt_parity.parity,pkt_h2.pkt_parity.parity);
  
  
  $display(" ------------------deep copy--------------------");
  pkt_h3 = new;
  pkt_h4 = new;
  pkt_h4 = pkt_h3.copy();
  $display("H3 %p",pkt_h3);
  $display("H4 %p",pkt_h4);
  $display("%p , %p ",pkt_h3.pkt_parity,pkt_h4.pkt_parity);
  pkt_h3.pkt_parity.parity = 22;
  
  $display("%p , %p ",pkt_h3.pkt_parity,pkt_h4.pkt_parity);
  
end

endmodule
