/* Generated by Yosys 0.9 (git sha1 UNKNOWN, clang 3.4.2 -fPIC -Os) */

(* src = "design.sv:2" *)
module fifo(clk, reset, rd_wr, en, din, empty, full, dout);
  (* src = "design.sv:10" *)
  wire [3:0] _000_;
  (* src = "design.sv:10" *)
  wire [7:0] _001_;
  (* src = "design.sv:10" *)
  wire [7:0] _002_;
  (* src = "design.sv:10" *)
  wire [3:0] _003_;
  (* src = "design.sv:10" *)
  wire [3:0] _004_;
  (* src = "design.sv:10" *)
  wire [3:0] _005_;
  (* src = "design.sv:10" *)
  wire [3:0] _006_;
  (* src = "design.sv:10" *)
  wire [3:0] _007_;
  (* src = "design.sv:10" *)
  wire [3:0] _008_;
  (* src = "design.sv:10" *)
  wire [3:0] _009_;
  (* src = "design.sv:10" *)
  wire [3:0] _010_;
  (* src = "design.sv:21" *)
  (* unused_bits = "4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _011_;
  (* src = "design.sv:26" *)
  (* unused_bits = "4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _012_;
  (* src = "design.sv:27" *)
  (* unused_bits = "4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire [7:0] _044_;
  (* src = "design.sv:19" *)
  wire _045_;
  (* src = "design.sv:31" *)
  wire _046_;
  (* src = "design.sv:32" *)
  wire _047_;
  (* src = "design.sv:12" *)
  wire _048_;
  (* src = "design.sv:19" *)
  wire _049_;
  (* src = "design.sv:19" *)
  wire _050_;
  (* src = "design.sv:24" *)
  wire _051_;
  (* src = "design.sv:24" *)
  wire _052_;
  wire [7:0] _053_;
  wire [7:0] _054_;
  wire [7:0] _055_;
  wire [7:0] _056_;
  wire [7:0] _057_;
  wire [7:0] _058_;
  wire [7:0] _059_;
  wire [7:0] _060_;
  wire [7:0] _061_;
  wire [7:0] _062_;
  wire [7:0] _063_;
  wire [7:0] _064_;
  wire [7:0] _065_;
  wire [7:0] _066_;
  wire [7:0] _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire [7:0] _084_;
  wire [7:0] _085_;
  wire [7:0] _086_;
  wire [7:0] _087_;
  wire [7:0] _088_;
  wire [7:0] _089_;
  wire [7:0] _090_;
  wire [7:0] _091_;
  wire [7:0] _092_;
  wire [7:0] _093_;
  wire [7:0] _094_;
  wire [7:0] _095_;
  wire [7:0] _096_;
  wire [7:0] _097_;
  wire [7:0] _098_;
  wire [7:0] _099_;
  (* src = "design.sv:19" *)
  wire _100_;
  (* src = "design.sv:24" *)
  wire _101_;
  wire [3:0] _102_;
  wire [3:0] _103_;
  wire [7:0] _104_;
  wire [7:0] _105_;
  wire [7:0] _106_;
  wire [7:0] _107_;
  (* src = "design.sv:22" *)
  (* unused_bits = "4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _108_;
  (* src = "design.sv:2" *)
  input clk;
  (* src = "design.sv:8" *)
  reg [3:0] count;
  (* src = "design.sv:3" *)
  input [7:0] din;
  (* src = "design.sv:5" *)
  output [7:0] dout;
  reg [7:0] dout;
  (* src = "design.sv:4" *)
  output empty;
  (* src = "design.sv:2" *)
  input en;
  (* src = "design.sv:4" *)
  output full;
  reg [7:0] \memory[0] ;
  reg [7:0] \memory[10] ;
  reg [7:0] \memory[11] ;
  reg [7:0] \memory[12] ;
  reg [7:0] \memory[13] ;
  reg [7:0] \memory[14] ;
  reg [7:0] \memory[15] ;
  reg [7:0] \memory[1] ;
  reg [7:0] \memory[2] ;
  reg [7:0] \memory[3] ;
  reg [7:0] \memory[4] ;
  reg [7:0] \memory[5] ;
  reg [7:0] \memory[6] ;
  reg [7:0] \memory[7] ;
  reg [7:0] \memory[8] ;
  reg [7:0] \memory[9] ;
  (* src = "design.sv:2" *)
  input rd_wr;
  (* src = "design.sv:8" *)
  reg [3:0] rdptr;
  (* src = "design.sv:2" *)
  input reset;
  (* src = "design.sv:8" *)
  reg [3:0] wrptr;
  assign _011_ = rdptr + (* src = "design.sv:21" *) 32'd1;
  assign _012_ = wrptr + (* src = "design.sv:26" *) 32'd1;
  assign _013_ = count + (* src = "design.sv:27" *) 32'd1;
  assign _015_ = ! _048_;
  assign _014_ = & { _050_, _015_ };
  assign _040_ = ~ _000_[0];
  assign _041_ = ~ _000_[1];
  assign _042_ = ~ _000_[2];
  assign _043_ = ~ _000_[3];
  assign _016_ = _040_ & _041_;
  assign _017_ = _042_ & _043_;
  assign _018_ = _016_ & _017_;
  assign _019_ = _000_[0] & _041_;
  assign _020_ = _019_ & _017_;
  assign _021_ = _040_ & _000_[1];
  assign _022_ = _021_ & _017_;
  assign _023_ = _000_[0] & _000_[1];
  assign _024_ = _023_ & _017_;
  assign _025_ = _000_[2] & _043_;
  assign _026_ = _016_ & _025_;
  assign _027_ = _019_ & _025_;
  assign _028_ = _021_ & _025_;
  assign _029_ = _023_ & _025_;
  assign _030_ = _042_ & _000_[3];
  assign _031_ = _016_ & _030_;
  assign _032_ = _019_ & _030_;
  assign _033_ = _021_ & _030_;
  assign _034_ = _023_ & _030_;
  assign _035_ = _000_[2] & _000_[3];
  assign _036_ = _016_ & _035_;
  assign _037_ = _019_ & _035_;
  assign _038_ = _021_ & _035_;
  assign _039_ = _023_ & _035_;
  assign _045_ = ~ (* src = "design.sv:19" *) rd_wr;
  assign _046_ = ! (* src = "design.sv:31" *) count;
  assign _047_ = count == (* src = "design.sv:32" *) 4'hf;
  assign _048_ = reset && (* src = "design.sv:12" *) en;
  assign _049_ = _045_ && (* src = "design.sv:19" *) _100_;
  assign _050_ = _049_ && (* src = "design.sv:19" *) en;
  assign _051_ = rd_wr && (* src = "design.sv:24" *) _101_;
  assign _052_ = _051_ && (* src = "design.sv:24" *) en;
  assign _044_ = _014_ ? _067_ : dout;
  assign _067_ = rdptr[3] ? _054_ : _053_;
  assign _053_ = rdptr[2] ? _056_ : _055_;
  assign _054_ = rdptr[2] ? _058_ : _057_;
  assign _055_ = rdptr[1] ? _060_ : _059_;
  assign _056_ = rdptr[1] ? _062_ : _061_;
  assign _057_ = rdptr[1] ? _064_ : _063_;
  assign _058_ = rdptr[1] ? _066_ : _065_;
  assign _059_ = rdptr[0] ? \memory[1]  : \memory[0] ;
  assign _060_ = rdptr[0] ? \memory[3]  : \memory[2] ;
  assign _061_ = rdptr[0] ? \memory[5]  : \memory[4] ;
  assign _062_ = rdptr[0] ? \memory[7]  : \memory[6] ;
  assign _063_ = rdptr[0] ? \memory[9]  : \memory[8] ;
  assign _064_ = rdptr[0] ? \memory[11]  : \memory[10] ;
  assign _065_ = rdptr[0] ? \memory[13]  : \memory[12] ;
  assign _066_ = rdptr[0] ? \memory[15]  : \memory[14] ;
  always @(posedge clk)
      dout <= _044_;
  assign _068_ = _018_ & _002_[7];
  assign _069_ = _033_ & _002_[7];
  assign _070_ = _034_ & _002_[7];
  assign _071_ = _036_ & _002_[7];
  assign _072_ = _037_ & _002_[7];
  assign _073_ = _038_ & _002_[7];
  assign _074_ = _039_ & _002_[7];
  assign _075_ = _020_ & _002_[7];
  assign _076_ = _022_ & _002_[7];
  assign _077_ = _024_ & _002_[7];
  assign _078_ = _026_ & _002_[7];
  assign _079_ = _027_ & _002_[7];
  assign _080_ = _028_ & _002_[7];
  assign _081_ = _029_ & _002_[7];
  assign _082_ = _031_ & _002_[7];
  assign _083_ = _032_ & _002_[7];
  assign _084_ = _068_ ? _001_ : \memory[0] ;
  assign _085_ = _069_ ? _001_ : \memory[10] ;
  assign _086_ = _070_ ? _001_ : \memory[11] ;
  assign _087_ = _071_ ? _001_ : \memory[12] ;
  assign _088_ = _072_ ? _001_ : \memory[13] ;
  assign _089_ = _073_ ? _001_ : \memory[14] ;
  assign _090_ = _074_ ? _001_ : \memory[15] ;
  assign _091_ = _075_ ? _001_ : \memory[1] ;
  assign _092_ = _076_ ? _001_ : \memory[2] ;
  assign _093_ = _077_ ? _001_ : \memory[3] ;
  assign _094_ = _078_ ? _001_ : \memory[4] ;
  assign _095_ = _079_ ? _001_ : \memory[5] ;
  assign _096_ = _080_ ? _001_ : \memory[6] ;
  assign _097_ = _081_ ? _001_ : \memory[7] ;
  assign _098_ = _082_ ? _001_ : \memory[8] ;
  assign _099_ = _083_ ? _001_ : \memory[9] ;
  always @(posedge clk)
      \memory[0]  <= _084_;
  always @(posedge clk)
      \memory[10]  <= _085_;
  always @(posedge clk)
      \memory[11]  <= _086_;
  always @(posedge clk)
      \memory[12]  <= _087_;
  always @(posedge clk)
      \memory[13]  <= _088_;
  always @(posedge clk)
      \memory[14]  <= _089_;
  always @(posedge clk)
      \memory[15]  <= _090_;
  always @(posedge clk)
      \memory[1]  <= _091_;
  always @(posedge clk)
      \memory[2]  <= _092_;
  always @(posedge clk)
      \memory[3]  <= _093_;
  always @(posedge clk)
      \memory[4]  <= _094_;
  always @(posedge clk)
      \memory[5]  <= _095_;
  always @(posedge clk)
      \memory[6]  <= _096_;
  always @(posedge clk)
      \memory[7]  <= _097_;
  always @(posedge clk)
      \memory[8]  <= _098_;
  always @(posedge clk)
      \memory[9]  <= _099_;
  assign _100_ = | (* src = "design.sv:19" *) count;
  assign _101_ = count != (* src = "design.sv:24" *) 4'hf;
  always @(posedge clk)
      rdptr <= _004_;
  always @(posedge clk)
      wrptr <= _005_;
  always @(posedge clk)
      count <= _003_;
  assign _102_ = _052_ ? (* full_case = 32'd1 *) (* src = "design.sv:24" *) wrptr : 4'hx;
  assign _103_ = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) 4'hx : _102_;
  assign _000_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 4'hx : _103_;
  assign _009_ = _052_ ? (* full_case = 32'd1 *) (* src = "design.sv:24" *) _013_[3:0] : count;
  assign _010_ = _052_ ? (* full_case = 32'd1 *) (* src = "design.sv:24" *) _012_[3:0] : wrptr;
  assign _006_ = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) _108_[3:0] : _009_;
  assign _007_ = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) _011_[3:0] : rdptr;
  assign _008_ = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) wrptr : _010_;
  assign _003_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 4'h0 : _006_;
  assign _005_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 4'h0 : _008_;
  assign _004_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 4'h0 : _007_;
  assign _104_[7] = _052_ ? (* full_case = 32'd1 *) (* src = "design.sv:24" *) 1'h1 : 1'h0;
  assign _105_[7] = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) 1'h0 : _104_[7];
  assign _002_[7] = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 1'h0 : _105_[7];
  assign _106_ = _052_ ? (* full_case = 32'd1 *) (* src = "design.sv:24" *) din : 8'hxx;
  assign _107_ = _050_ ? (* full_case = 32'd1 *) (* src = "design.sv:19" *) 8'hxx : _106_;
  assign _001_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:12" *) 8'hxx : _107_;
  assign _108_ = count - (* src = "design.sv:22" *) 32'd1;
  assign empty = _046_ ? (* src = "design.sv:31" *) 1'h1 : 1'h0;
  assign full = _047_ ? (* src = "design.sv:32" *) 1'h1 : 1'h0;
  assign _002_[6:0] = { _002_[7], _002_[7], _002_[7], _002_[7], _002_[7], _002_[7], _002_[7] };
  assign _104_[6:0] = { _104_[7], _104_[7], _104_[7], _104_[7], _104_[7], _104_[7], _104_[7] };
  assign _105_[6:0] = { _105_[7], _105_[7], _105_[7], _105_[7], _105_[7], _105_[7], _105_[7] };
endmodule
