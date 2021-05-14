// Code your design here
module i2c_slave( 
  inout SDA,
  input SCL,reset,
  input [7:0] din,
  input [6:0] address,
  output reg [7:0] dout 
);
 
  reg [2:0] count;
  reg sda,sda_sense,mode,ACK; // sda_sense is to sensetize sda in start and stop conditions to trigger logic otherwise stay insensetive.
  reg [7:0] tx_reg;
  wire sda_check;
  and a1(sda_check , SDA,sda_sense);
  
  
  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7,S8 = 8 ,S9 = 9, sender_mode = 0, receiver_mode = 1;
  reg [3:0] state;
/// SCL clocking events
  always @(SCL , sda_check,reset)
        begin
          if(reset == 1) begin
            state = S0;
            sda =1;
            tx_reg =0;
          end
          else
            
            case(state)
            
              S0 :begin
                if(SDA == 0 && SCL == 1)begin
                  state = S1;
                  sda_sense = 0;
                  count = 0;
                  ACK = 0;
                end
              		else begin
                      sda = 1;
                      state = S0;
              		  sda_sense = 1;
                      count = 0;
                    end
              	end
              
              S1 : state = S2;
              
              S2 : begin
                	tx_reg[~count] = SDA;
                	if(count == 7) state = S3;
                	else state = S1;
              		count = count +1;
              	end
              
              S3 : begin
                if(tx_reg[7:1] == address) begin
                 ACK = 1;
                  sda = 0;
                  mode = tx_reg[0];
              	 	 end
              	  state = S4;
            	  end
              
              S4 : begin
                state = S5;
                if(mode == sender_mode) tx_reg = din;
                end
              
              S5 : if( SCL == 0)begin
                if(mode == sender_mode)begin
                  if(count == 0 && ACK == 0) state = S0;
                  else state = S6;
                  sda = tx_reg[~count];
                end
                else begin
                  ACK = 0;
                  sda = 1;
                   state = S6;
                end
                
               
              end
              
              S6 :if( SCL == 1) begin
                if(count == 0 && SDA == 0)begin
                  sda_sense = 1;
                  state = S9;
                  
                end
                else begin
                     if(count == 7) state = S7;
               		   else state = S5;
                     end
                
                if(mode == receiver_mode) tx_reg[~count] = SDA;
                count = count +1;
              end
              
              S7 :if( SCL == 0) begin
                if(mode == receiver_mode) begin
                  sda = 0;
                ACK = 1;
                //state = S8;
                  end
              ///else if (sendermode) check if anything required here 
              state = S8;
              end
              
              S8 :if( SCL == 1) begin
                state = S5;
                if(mode == receiver_mode) dout = tx_reg;
                else if(mode == sender_mode && SDA == 0) begin 
                  ACK = 1;
                  tx_reg = din;
               	 end
                else begin
                  ACK = 0;
                 // state = S0;
                end
                
              end
              
              S9 : if(SCL == 0 || SDA == 1) begin
                if(SDA == 1) state = S0;
                
                if (SCL == 0) begin
                  if( mode == sender_mode) sda = tx_reg[~count];
                else sda = 1;
                state = S6;
                sda_sense = 0;
                
                end
              end
              default : state = S0;
            endcase
          
          
          
    end

  
  
  assign SDA = (sda == 1) ? 1'bz : 1'b0;
  
  
endmodule