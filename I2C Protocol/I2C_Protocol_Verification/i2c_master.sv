
module i2c_master(
input clk,rd_wr,start,stop,reset,
  input [6:0] address,
  input [7:0] din,
  inout SDA,
  output SCL,
  output reg [7:0] dout
);
  reg [3:0] state ;
  parameter S0 = 0, S1 = 1, S2 = 2 , S3 = 3, S4 =4 , S5 = 5 , S6 = 6, S7 = 7, S8 = 8, S9 = 9,S10 = 10, S11 = 11, S12 = 12,S13 = 13, S14 = 14 ,sender_mode = 1,receiver_mode = 0,address_phase = 0,data_phase = 1;
  reg [2:0] count;
  reg scl , sda,ack,mode;
   reg [7:0] tx_reg;
  
 
  
  ////////////////////////////////////
  
  always @(posedge clk ) begin
    
    if (reset) begin
      count = 0;
      state = S0;
      
      scl = 1;
      sda = 1;
    end
  
  else  
    
    case (state) 
      
      S0 : begin
        if (start == 1'b1) 
          state = S1 ;
          else state = S0;
        scl = 1;
        sda = 1;
      
      end
      
      S1 : begin
        state = S2;
        sda = 0;
        count = 0;
        mode = rd_wr; // read or write status must be maintained by user at rd_wr pin
        tx_reg = {address,rd_wr};
       
      	end
        
      S2 : begin
        scl = 0; // falling edge by master
        state = S3;
        sda = tx_reg[~count] ;
         
        
      end
      
      S3 : begin
	        scl = 1;// rising edge by master 
        count = count +1;
        if (count == 0) state = S4;
        else state = S2;
      end

               
           
     
      
	  S4 : begin
        state = S5;
        scl = 0; // negedge scl
        
      end
      
      S5 : begin
        scl = 1; //rising edge
        
        if(SDA == 0) ack = 1;
        else ack = 0;
        
       	 if(ack == 0) state = S0;
       	 else begin
         	
           if(ack == 1 && mode == receiver_mode) begin
           	 state = S8;
          	  tx_reg = 0;
        	  end
         
         	 if(ack == 1 && mode == sender_mode) begin
          	  state = S6;
          	  tx_reg = din;
        	  end
//in place of ack SDA can be directly used here to check
       end
      end

      
      S6 : begin
            scl = 0; // negedge scl
        if(count == 0 && stop == 1) begin //for stop detection
          	state = S13;
        	  sda = 0;
        	end
        	else begin
          	state = S7;
          	sda = tx_reg[~count];
      	  	end
        
      	end
      
      S7 : begin
        
        scl = 1; //posedge scl
        count = count +1;
        if(count == 0)state = S4;
        else state = S6;
        
      end
      
      S8 : begin
        scl = 0; // negedge scl
        sda=1;/////edited	
        if(stop == 1)begin
          	state = S13;
          		sda = 0;
        	end
        else state = S9;
               
      end
        
        
      S9 : begin
        scl = 1; // posedge scl
        tx_reg[~count] = SDA;
        if(count == 7) state =S11;
        else state = S10;
        
      end
      
      S10 : begin
        scl = 0 ; // negedge scl
        count = count +1;
        state = S9;
                
      end

      
      S11 : begin
        scl = 0 ; // negedge scl
        sda = 0;
        count = 0;
        state = S12;
      end

      
      S12 : begin
        scl = 1; // posedge scl
        dout = tx_reg;
        state = S8;
        
      end

      
      S13 : begin
         scl = 1; // posedge scl
        state = S14;
        
      end

      
      S14 : begin
        //stop
        sda = 1;
        state = S0;
        
      end

       

     

    endcase
   
  end
          
  assign SDA = (sda == 0 ) ? 1'b0 : 1'bz ;
  assign SCL = (scl == 0 ) ? 1'b0 : 1'bz ;
      
  
endmodule