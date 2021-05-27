// Code your design here
module i2c_master(
input clk,rd_wr,start,stop,reset,
  input [6:0] address,
  input [7:0] din,
  inout SDA,
  output SCL,
  output [7:0] dout
);
  reg [3:0] state ;
  parameter S0 = 0, S1 = 1, S2 = 2 , S3 = 3, S4 =4 , S5 = 5 , S6 = 6, S7 = 7, S8 = 8, S9 = 9,sender_mode = 1,receiver_mode = 0,address_phase = 0,data_phase = 1;
  reg [2:0] count;
  reg scl , sda,ack,phase,mode;
  //phase == 0 for address phase  = 1 for data
  //mode = 1 => master sender mode 0 => master receiver
  reg [7:0] tx_reg;
  
  /////////////////////////////////////
  //Fifo instance
 // wire fifo_empty,fifo_full,fifo_din,fifo_dout,fifo_en, fifo_reset;
  
  
 
  
  //  fifo tx_fifo( clk, fifo_reset,rd_wr,fifo_en,fifo_din,fifo_empty,fifo_full,fifo_dout);
  ///for testing use memory
  //reg [7:0] memory[7:0];
  
  ////////////////////////////////////
  
  always @(posedge clk )
    if (reset) begin
      count = 0;
      state = S0;
      
      scl = 1;
      sda = 1;
    end
  
  else begin
    
    
    case (state) 
      
      S0 : begin
        if (start == 1'b1) 
          state = S1 ;
          else state = S0;
      phase = address_phase;
        count = 0;
      end
      
      S1 : begin
        state = S2;
        sda = 0;
        
        mode = rd_wr; // read or write status must be maintained by user at rd_wr pin
       
       tx_reg = {address,rd_wr};
       
      end
        
      S2 : begin
        scl = 0; // falling edge by master
        
        state = S3;
        
        
        if(mode != receiver_mode || phase == address_phase) sda = tx_reg[~count] ;
        count = count + 1'b1 ;
        //sender sets bit //set sda after scl falls (in write mode) 
        
      end
      
      S3 : begin
        if( phase == data_phase && mode == receiver_mode )
          begin
            tx_reg[~count] = SDA;   
            state = S2;
          end
        else begin
        if(count == 3'b000) state = S4;
        else state = S2;
        end
        scl = 1;// rising edge by master 
               
             // if working as receiver capture the data here in data phase
      end
      
	  S4 : begin
        state = S5;
        scl = 0;
        if( phase == data_phase && mode == receiver_mode ) sda = 0; //unconditional acknowledge
        else  sda = 1;// ade z for ack
      end
      
      S5 : begin
        scl = 1; //rising edge
        if( phase == data_phase && mode == receiver_mode )
          begin
            sda = 0;
            state = S2;///// figure out in which state to go after ack in receiver mode.
          end
        else begin
        if(SDA == 0) ack = 1;
        else ack = 0;
        
        // check for SDA ACK or NACK
        if( SDA == 1 || stop ==1 ) state = S6; // goes to stop//if( fifoempty or sda = 1;)
        else 	begin
          		state = S2;
          		phase = data_phase;
          		//count = 0;
          		//tx_reg = fifo_out; 
          tx_reg = din;
          
        		end
        end
      end
      
      S6 : begin
        state = S7;
        scl = 0;
       
        sda = 1;
      end
      
      S7 : begin
        state = S8;
        scl = 1;
        sda = 0;
        
      end
      
      S8 : begin
        //stop
        state = S0;
        sda = 1;
        //$display("stop");
      end
      


     

endcase
     // try with (based on count value if sda and scl  both are 1 then it is stop)
  end
      
  assign SDA = (sda == 0 ) ? 1'b0 : 1'bz ;
  assign SCL = (scl == 0 ) ? 1'b0 : 1'bz ;
      
  
endmodule
