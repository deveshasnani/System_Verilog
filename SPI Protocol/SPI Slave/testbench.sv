module spi_slave_tb;
  
  reg SCLK,MOSI,SS;
  reg [7:0] din;
  reg [1:0] mode;
  wire MISO;
  
  spi_slave dut(SCLK,MOSI,SS,din,mode,MISO);
  
  
  initial 
   
    begin
    $dumpvars;
    SCLK =0;
    din = 0;
    mode = 0;
    SS = 1;
    MOSI =1;
    #100
    
    din = 8'h24;
    #5
    SS = 0;
    
    repeat (8)
      begin
        
    	#20
        SCLK = 1;
    	#20
    	SCLK = 0;
    	
   	  end
    #20
    SS = 1;
    #500
      
      din = 8'h11;
    #5
    SS = 0;
    
    repeat (8)
      begin
        
    	#20
        SCLK = 1;
    	#20
    	SCLK = 0;
    	
   	  end
    #20
    SS = 1;
      
    $finish;
  end
  
  
endmodule
