module test;
  
  initial
    begin
      fork
   #20  $display($time," 1") ;
   #10  $display($time," 2") ;
    #40 $display($time," 3") ;
    #30 $display($time," 4") ;
    #10 $display($time," 5") ;

     
        //join;
        //join_none;
      join_any;
     
     #10     $display($time," 6") ;

    end
  
endmodule

