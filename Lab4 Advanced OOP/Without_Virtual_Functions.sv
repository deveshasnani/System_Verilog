module test;
class packet_c;
  
  task send();
    $display("Sending base class packet"); 
  endtask

endclass
             
class  badpacket_c extends packet_c;
  task send();
    $display("Sending derived class packet"); 
  endtask
endclass
 
 initial
   begin
     badpacket_c badpkt;
     packet_c goodpkt;
     badpkt.send();
     goodpkt.send();
     goodpkt = badpkt;
     
     
   end
             
             endmodule           