


program testcase(msintf intf);
  environment env;
  
 
   
       initial
    begin
      
      $display("sim start");
       intf.mode <=0;
      env = new(intf);
      env.build();
      env.reset();
      
     
      repeat(20)
      env.start();
      
      //intf.mode <= 1;
     //repeat(1)
     // env.start();
      
      //intf.mode <= 2;
      //repeat(1)
      //env.start();
      //intf.mode <= 3;
      //repeat(1)
      //env.start();
      #1000
      $display("simulation done");
  #20
      $finish();
    end
    
  



  
  
endprogram
