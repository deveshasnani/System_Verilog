


program testcase(msintf intf);
  environment env;
  
  
  initial
    begin
      
      $display("sim start");
       intf.mode <= 0;
      env = new(intf);
      env.build();
      env.reset();
      repeat(2)
      env.start();
      
      //intf.mode <= 3;
      //repeat(2)
      //env.start();
      #1000
      $display("simulation done");
  #20
      $finish();
    end
    // Assertions
  
  //
endprogram
