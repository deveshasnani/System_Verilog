// Code your design here
module fifo( input clk,reset,rd_wr,en,
            input [7:0] din,
            output  empty,full,
            output reg [7:0] dout);
  
  reg [7:0] memory [15:0];
  reg [3:0] rdptr, wrptr, count;
  
  always @(posedge clk) begin
    
    if(reset && en == 1)begin
      rdptr = 0;
      wrptr = 0;
      count = 0;
    end
    
    else
      if(rd_wr == 0 && count != 0 && en ==1) begin
        dout = memory[rdptr];
        rdptr = rdptr +1;
        count = count - 1;
      end
    else  if(rd_wr == 1 && count != 4'b1111 && en ==1) begin
      memory[wrptr] = din;
        wrptr = wrptr +1;
        count = count + 1;
      end
  else ;
  end
  assign empty = (count ==0) ? 1'b1 : 1'b0;
  assign full = (count == 4'b1111) ? 1'b1 : 1'b0;
endmodule