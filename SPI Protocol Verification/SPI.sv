// Code your design here
module master#(parameter wordlen = 8)(input MISO,start,clk,
output reg SCLK,MOSI,SS,
input  [wordlen-1 :0] data );
//parameter wordlen = 8 ; 
reg [wordlen-1 :0] shiftreg;
  reg [1:0] mode;
  
  
  
  wire CK;
  
  assign CK = (mode == 2|| mode == 3) ? clk : ~clk;  
assign SCLK = CK & ~SS;


always @(posedge start)begin
shiftreg = data;
SS = 0;
repeat(wordlen)begin
  if (mode == 0 || mode == 3)begin
@(negedge SCLK) MOSI =shiftreg[0]; 
 @(posedge SCLK) 
shiftreg[wordlen-2:0] = shiftreg[wordlen-1:1];
shiftreg[wordlen-1] = MISO;
  end
  else begin
    @(posedge SCLK) MOSI =shiftreg[0]; 
    @(negedge SCLK) 
shiftreg[wordlen-2:0] = shiftreg[wordlen-1:1];
shiftreg[wordlen-1] = MISO;
  end
    
end
SS = 1;
end
endmodule




module slave #(parameter wordlen = 8)(output  MISO,
input  SCLK,MOSI,SS,
input [wordlen-1 :0] data );
//parameter wordlen = 8;
reg MISO_temp;
  reg [1:0] mode;
  reg [wordlen-1 :0] shiftreg;
  always @ (negedge SS) begin
  shiftreg = data;
  
  while(SS==0)begin
     if (mode == 0 || mode == 3)
       begin
@ (negedge SCLK) MISO_temp =shiftreg[0];
         if(SS==1) break;
@(posedge SCLK) 
shiftreg[wordlen-2:0] = shiftreg[wordlen-1:1];
shiftreg[wordlen-1] = MOSI;
     end
    else begin
      @ (posedge SCLK) MISO_temp =shiftreg[0];
      if(SS==1) break;
      @(negedge SCLK) 
shiftreg[wordlen-2:0] = shiftreg[wordlen-1:1];
shiftreg[wordlen-1] = MOSI;
    end
  end
end

  assign MISO = (SS == 1) ? 1'bz : MISO_temp;
endmodule







