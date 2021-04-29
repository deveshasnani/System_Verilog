
/// spi final Synthesizable

module spi_master(input clk, start, MISO,reset,
                  input [7:0] din,
                  input [1:0] mode,
                 output reg MOSI, SS, SCLK);
  
  reg [2:0] state ;
  parameter S0 = 0 , S1 = 1, S2=2,S3=3,S4=4 , S5 = 5;
  reg [7:0] memory ;
  reg [2:0] count ;
  // S0 wait for start
  // S1 do SS = 0 and load memory
  // S2 produce SCLK leading edge
  // S3 produce SCLK trailing edge // count != full)
  // S4 do SS = 1 and mosi = z
  // s5 do reset
  
  always @(posedge clk) begin
  
    if(reset ==1 ) state <= S5;
      
  else  
    case(state)//next state logic
      S0 : begin 
        	if(start ==1) state <= S1;
            else state <=S0;
                MOSI = 1'bz;
                count = 0;
              end 
      S1 :begin
        		state <= S2;
              	memory = din;
                MOSI = memory[0];
               	SS = 0;
              end 
      S2  : begin
       				 state <= S3;
        			if(mode[1]==0) SCLK = 1;
       				else SCLK = 0;
      				if(mode[0] == 0) memory = {MISO,memory[7:1]};
      				else MOSI = memory[0];
              end 
      
      S3 : 
         begin
           if(count ==7)state <=S4;
           else 
          begin state <= S2;
          count <= count +1;
        end      
          
           if(mode[1]==1) SCLK = 1;
        			else SCLK = 0;
        			if(mode[0] == 1)memory = {MISO,memory[7:1]};
                    else MOSI = memory[0];
             	 
          end
      
          
      S4 :  begin
                    state <= S0;
        			SS = 1;
                  	MOSI = 1'bz;
               		
              	end 
      S5 : begin
          state <= S0;
          if(mode[1] ==0 )SCLK = 0;
          else SCLK = 1;
          MOSI = 1'bz;
          SS = 1;
          count = 0;
          
       	 end
      default : state <= S0;
        endcase
  end
        
                  
endmodule