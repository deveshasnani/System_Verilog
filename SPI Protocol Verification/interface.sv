
interface msintf( );
  logic [7:0] masterin,slavein,masterout,slaveout; // connect in env
   
  logic start;
 logic clk;
  logic [1:0] mode;// set in test
   
endinterface
