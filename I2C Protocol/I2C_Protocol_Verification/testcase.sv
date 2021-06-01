`include "environment.sv"
program testcase(master_interface mintf,slave_interface sintf);
  
  environment env;
  initial
    begin
      env = new(mintf,sintf);
  
  env.build();
 #200
  env.reset();
  #200
    // force env.mdrv.pkt.mode=1;
      fork
        env.start(2);
      join;
  #100
      env.build(); //// error line
      #200
      env.reset();
  #200
    // force env.mdrv.pkt.mode=1;
      fork
        env.start(2);
      join;
  #100
      
      
  $finish;
    end
endprogram