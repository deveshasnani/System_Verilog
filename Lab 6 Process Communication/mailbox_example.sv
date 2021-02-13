module test2 ;
 ///////////////////////////////////////////////////// 
class packet;
  
  rand bit [3:0] addr, data ;
  
  function void display(input string message );
    $display("%s",message);
    $display("data = %d		address = %d",data,addr);
  endfunction
  
  function void post_randomize();
    display("RANDOMIZED DATA");
  endfunction
   
endclass :packet
  /////////////////////////////////////////////////////
  class generator;
   packet pkt_g;
    mailbox #(packet) mbx;
    
    function  new (mailbox #(packet) mail);
      mbx = mail;
      
      
    endfunction    
 
    task start();
      repeat(10)
        begin
          pkt_g =new;
          assert( pkt_g.randomize)
          else $display("rand fail");
          mbx.put(pkt_g); 
        end
    endtask
    
   endclass :generator
 /////////////////////////////////////////////////////// 
  class driver;
    packet pkt_d;
    mailbox #(packet) mbx_d;
      
    function  new(mailbox #(packet) mail);
      mbx_d = mail;
       
    endfunction
    
     task start();
      repeat(10)
        begin
        pkt_d =new;    mbx_d.get(pkt_d);
          pkt_d.display("[DRIVER] mbx.get_packet ");
        end
    endtask
    
  endclass
//////////////////////////////////////////////////////////
 class env;
   mailbox #(packet) mbx_env=new;
   generator gen;
   driver drv ;
  
   function void build( );
     gen=new(mbx_env);
     drv=new(mbx_env);
   endfunction
   
   task start();
     fork
       gen.start();
       drv.start();
     join;
   endtask
 endclass:env
  ///////////////////////////////////////////////////////
  
  initial
    begin
      env my_env = new;
      my_env.build();
      my_env.start();
      
    end
  
  
endmodule