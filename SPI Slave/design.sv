
module spi_slave( 
  input SCLK,MOSI,SS,
  input [7:0] din,
  input [1:0] mode,
  output MISO);
  
  reg [7:0] memory; 
  reg misoreg;
  assign MISO = (SS == 1) ?  1'bz :misoreg;
  
  always @(negedge SS)
    begin
      memory = din;
      misoreg = memory[0];
    end
  
  always @(SCLK)
    begin
      if(SCLK ==1) begin//posedge
        case(mode)
        0 :   memory <= {MOSI , memory[7:1]};
        1 :   misoreg = memory[0];
        2 :   misoreg = memory[0];
        3 :   memory <= {MOSI , memory[7:1]};
          
        endcase
        
        // if(mode == 0) memory <= {MOSI , memory[7:1]};
       // else misoreg = memory[0];
            end
            
      else if(SCLK == 0) begin  //negedge
        case(mode)
        3 :   misoreg = memory[0];
        2 :   memory <= {MOSI , memory[7:1]};
        1 :   memory <= {MOSI , memory[7:1]};
        0 :   misoreg = memory[0];
          
        endcase  
        //    if(mode[0] == 0) misoreg = memory[0];
          //else memory <= {MOSI , memory[7:1]};
              
            end
    end
endmodule
