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
      fork
           env.start(1);
      join_none;
  #8000
  $finish;
    end
endprogram