/* Generated by Yosys 0.9 (git sha1 UNKNOWN, clang 3.4.2 -fPIC -Os) */

(* src = "design.sv:2" *)
module i2c_master(clk, rd_wr, start, stop, reset, address, din, SDA, SCL, dout);
  (* src = "design.sv:20" *)
  wire [2:0] _000_;
  (* src = "design.sv:20" *)
  wire [7:0] _001_;
  (* src = "design.sv:20" *)
  wire _002_;
  (* src = "design.sv:20" *)
  wire _003_;
  (* src = "design.sv:20" *)
  wire _004_;
  (* src = "design.sv:20" *)
  wire [3:0] _005_;
  (* src = "design.sv:20" *)
  wire [7:0] _006_;
  (* src = "design.sv:20" *)
  wire [3:0] _007_;
  (* src = "design.sv:20" *)
  wire [2:0] _008_;
  (* src = "design.sv:20" *)
  wire [7:0] _009_;
  (* src = "design.sv:20" *)
  wire _010_;
  (* src = "design.sv:20" *)
  wire _011_;
  (* src = "design.sv:20" *)
  wire _012_;
  (* src = "design.sv:20" *)
  wire [3:0] _013_;
  (* src = "design.sv:20" *)
  wire [7:0] _014_;
  (* src = "design.sv:20" *)
  wire _015_;
  (* src = "design.sv:20" *)
  wire _016_;
  (* src = "design.sv:20" *)
  wire [3:0] _017_;
  (* src = "design.sv:20" *)
  wire [7:0] _018_;
  (* src = "design.sv:20" *)
  wire _019_;
  (* src = "design.sv:20" *)
  wire [3:0] _020_;
  (* src = "design.sv:20" *)
  wire [7:0] _021_;
  (* src = "design.sv:20" *)
  wire [3:0] _022_;
  (* src = "design.sv:20" *)
  wire [7:0] _023_;
  (* src = "design.sv:20" *)
  wire [3:0] _024_;
  (* src = "design.sv:20" *)
  wire [7:0] _025_;
  (* src = "design.sv:20" *)
  wire [3:0] _026_;
  (* src = "design.sv:20" *)
  wire [3:0] _027_;
  (* src = "design.sv:20" *)
  wire [3:0] _028_;
  (* src = "design.sv:116" *)
  (* unused_bits = "3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _029_;
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
  (* src = "design.sv:102" *)
  wire _043_;
  (* src = "design.sv:135" *)
  wire _044_;
  (* src = "design.sv:63" *)
  wire _045_;
  (* src = "design.sv:86" *)
  wire _046_;
  (* src = "design.sv:102" *)
  wire _047_;
  (* src = "design.sv:86" *)
  wire _048_;
  (* src = "design.sv:91" *)
  wire _049_;
  (* src = "design.sv:108" *)
  wire [2:0] _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  (* src = "design.sv:108" *)
  wire _076_;
  (* src = "design.sv:7" *)
  output SCL;
  (* src = "design.sv:6" *)
  inout SDA;
  (* src = "design.sv:4" *)
  input [6:0] address;
  (* src = "design.sv:3" *)
  input clk;
  (* src = "design.sv:12" *)
  reg [2:0] count;
  (* src = "design.sv:5" *)
  input [7:0] din;
  (* src = "design.sv:8" *)
  output [7:0] dout;
  reg [7:0] dout;
  (* src = "design.sv:13" *)
  reg mode;
  (* src = "design.sv:3" *)
  input rd_wr;
  (* src = "design.sv:3" *)
  input reset;
  (* src = "design.sv:13" *)
  reg scl;
  (* src = "design.sv:13" *)
  reg sda;
  (* src = "design.sv:3" *)
  input start;
  (* src = "design.sv:10" *)
  reg [3:0] state;
  (* src = "design.sv:3" *)
  input stop;
  (* src = "design.sv:14" *)
  reg [7:0] tx_reg;
  assign _029_ = count + (* src = "design.sv:142" *) 32'd1;
  assign _030_ = | { _066_, _067_ };
  assign _032_ = | { _054_, _052_, _053_, _055_, _056_, _057_, _058_ };
  assign _033_ = | { _054_, _051_, _052_, _053_, _055_, _056_, _057_ };
  assign _034_ = | { _054_, _051_, _052_, _053_, _055_, _056_, _058_ };
  assign _035_ = | { _054_, _051_, _052_, _053_, _056_, _057_, _058_ };
  assign _036_ = | { _051_, _052_, _053_, _055_, _056_, _057_, _058_ };
  assign _037_ = | { _054_, _051_, _052_, _055_, _056_, _057_, _058_ };
  assign _031_ = | { _068_, _070_ };
  assign _038_ = | { _065_, _073_, _074_ };
  assign _039_ = | { _054_, _051_, _053_, _055_, _056_, _057_, _058_ };
  assign _040_ = | { _059_, _062_, _065_, _066_, _071_, _072_, _074_ };
  assign _041_ = | { _060_, _061_, _068_, _069_, _073_, _075_ };
  assign _042_ = | { _054_, _051_, _052_, _053_, _055_, _057_, _058_ };
  assign _043_ = ! (* src = "design.sv:102" *) count;
  assign _044_ = count == (* src = "design.sv:135" *) 3'h7;
  assign _045_ = ! (* src = "design.sv:63" *) _029_[2:0];
  assign _046_ = ~ (* src = "design.sv:86" *) mode;
  assign _047_ = _043_ && (* src = "design.sv:102" *) stop;
  assign _048_ = _015_ && (* src = "design.sv:86" *) _046_;
  assign _049_ = _015_ && (* src = "design.sv:91" *) mode;
  assign _050_ = ~ (* src = "design.sv:134" *) count;
  always @(posedge clk)
      dout <= _001_;
  always @(posedge clk)
      state <= _005_;
  always @(posedge clk)
      count <= _000_;
  always @(posedge clk)
      scl <= _003_;
  always @(posedge clk)
      sda <= _004_;
  always @(posedge clk)
      mode <= _002_;
  always @(posedge clk)
      tx_reg <= _006_;
  function [0:0] _106_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _106_ = b[0:0];
      2'b1?:
        _106_ = b[1:1];
      default:
        _106_ = a;
    endcase
  endfunction
  assign _025_[1] = _106_(1'hx, { SDA, tx_reg[1] }, { _057_, _034_ });
  function [0:0] _107_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _107_ = b[0:0];
      2'b1?:
        _107_ = b[1:1];
      default:
        _107_ = a;
    endcase
  endfunction
  assign _025_[7] = _107_(1'hx, { tx_reg[7], SDA }, { _032_, _051_ });
  function [0:0] _108_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _108_ = b[0:0];
      2'b1?:
        _108_ = b[1:1];
      default:
        _108_ = a;
    endcase
  endfunction
  assign _025_[2] = _108_(1'hx, { SDA, tx_reg[2] }, { _056_, _042_ });
  function [0:0] _109_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _109_ = b[0:0];
      2'b1?:
        _109_ = b[1:1];
      default:
        _109_ = a;
    endcase
  endfunction
  assign _025_[4] = _109_(1'hx, { SDA, tx_reg[4] }, { _054_, _036_ });
  function [0:0] _110_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _110_ = b[0:0];
      2'b1?:
        _110_ = b[1:1];
      default:
        _110_ = a;
    endcase
  endfunction
  assign _025_[0] = _110_(1'hx, { SDA, tx_reg[0] }, { _058_, _033_ });
  assign _051_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h7;
  assign _052_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h6;
  assign _053_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h5;
  assign _054_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h4;
  assign _055_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h3;
  assign _056_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h2;
  assign _057_ = _050_ == (* full_case = 32'd1 *) (* src = "design.sv:134" *) 3'h1;
  assign _058_ = ! (* full_case = 32'd1 *) (* src = "design.sv:134" *) _050_;
  assign _019_ = stop ? (* full_case = 32'd1 *) (* src = "design.sv:123" *) 1'h0 : sda;
  assign _028_ = stop ? (* full_case = 32'd1 *) (* src = "design.sv:123" *) 4'hd : 4'h9;
  assign _016_ = _047_ ? (* full_case = 32'd1 *) (* src = "design.sv:102" *) 1'h0 : _076_;
  assign _027_ = _047_ ? (* full_case = 32'd1 *) (* src = "design.sv:102" *) 4'hd : 4'h7;
  assign _023_ = _049_ ? (* full_case = 32'd1 *) (* src = "design.sv:91" *) din : _021_;
  assign _026_ = _049_ ? (* full_case = 32'd1 *) (* src = "design.sv:91" *) 4'h6 : _024_;
  assign _021_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:86" *) 8'h00 : tx_reg;
  assign _024_ = _048_ ? (* full_case = 32'd1 *) (* src = "design.sv:86" *) 4'h8 : state;
  assign _007_ = _044_ ? (* full_case = 32'd1 *) (* src = "design.sv:135" *) 4'hb : 4'ha;
  assign _022_ = _015_ ? (* full_case = 32'd1 *) (* src = "design.sv:83" *) _026_ : 4'h0;
  assign _018_ = _015_ ? (* full_case = 32'd1 *) (* src = "design.sv:83" *) _023_ : tx_reg;
  assign _063_ = SDA ? (* full_case = 32'd1 *) (* src = "design.sv:80" *) 1'h0 : 1'h1;
  assign _064_ = _062_ ? (* full_case = 32'd1 *) (* src = "design.sv:77|design.sv:32" *) _063_ : 1'hx;
  assign _015_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 1'hx : _064_;
  assign _020_ = _045_ ? (* full_case = 32'd1 *) (* src = "design.sv:63" *) 4'h4 : 4'h2;
  assign _017_ = start ? (* full_case = 32'd1 *) (* src = "design.sv:35" *) 4'h1 : 4'h0;
  function [0:0] _135_;
    input [0:0] a;
    input [4:0] b;
    input [4:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:171|design.sv:32" *)
    (* parallel_case *)
    casez (s)
      5'b????1:
        _135_ = b[0:0];
      5'b???1?:
        _135_ = b[1:1];
      5'b??1??:
        _135_ = b[2:2];
      5'b?1???:
        _135_ = b[3:3];
      5'b1????:
        _135_ = b[4:4];
      default:
        _135_ = a;
    endcase
  endfunction
  assign _012_ = _135_(sda, { _076_, _016_, _019_, 2'h1 }, { _069_, _061_, _060_, _031_, _030_ });
  function [0:0] _136_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:164|design.sv:32" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _136_ = b[0:0];
      2'b1?:
        _136_ = b[1:1];
      default:
        _136_ = a;
    endcase
  endfunction
  assign _011_ = _136_(scl, 2'h1, { _041_, _040_ });
  function [3:0] _137_;
    input [3:0] a;
    input [59:0] b;
    input [14:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:171|design.sv:32" *)
    (* parallel_case *)
    casez (s)
      15'b??????????????1:
        _137_ = b[3:0];
      15'b?????????????1?:
        _137_ = b[7:4];
      15'b????????????1??:
        _137_ = b[11:8];
      15'b???????????1???:
        _137_ = b[15:12];
      15'b??????????1????:
        _137_ = b[19:16];
      15'b?????????1?????:
        _137_ = b[23:20];
      15'b????????1??????:
        _137_ = b[27:24];
      15'b???????1???????:
        _137_ = b[31:28];
      15'b??????1????????:
        _137_ = b[35:32];
      15'b?????1?????????:
        _137_ = b[39:36];
      15'b????1??????????:
        _137_ = b[43:40];
      15'b???1???????????:
        _137_ = b[47:44];
      15'b??1????????????:
        _137_ = b[51:48];
      15'b?1?????????????:
        _137_ = b[55:52];
      15'b1??????????????:
        _137_ = b[59:56];
      default:
        _137_ = a;
    endcase
  endfunction
  assign _013_ = _137_(state, { _017_, 8'h23, _020_, 4'h5, _022_, _027_, 4'h6, _028_, _007_, 20'h9c8e0 }, { _066_, _070_, _069_, _065_, _075_, _062_, _061_, _074_, _060_, _059_, _073_, _068_, _072_, _071_, _067_ });
  assign _067_ = state == (* full_case = 32'd1 *) (* src = "design.sv:171|design.sv:32" *) 4'he;
  assign _071_ = state == (* full_case = 32'd1 *) (* src = "design.sv:164|design.sv:32" *) 4'hd;
  assign _060_ = state == (* full_case = 32'd1 *) (* src = "design.sv:121|design.sv:32" *) 4'h8;
  assign _061_ = state == (* full_case = 32'd1 *) (* src = "design.sv:100|design.sv:32" *) 4'h6;
  function [0:0] _142_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _142_ = b[0:0];
      2'b1?:
        _142_ = b[1:1];
      default:
        _142_ = a;
    endcase
  endfunction
  assign _025_[6] = _142_(1'hx, { SDA, tx_reg[6] }, { _052_, _039_ });
  assign _075_ = state == (* full_case = 32'd1 *) (* src = "design.sv:71|design.sv:32" *) 4'h4;
  assign _069_ = state == (* full_case = 32'd1 *) (* src = "design.sv:52|design.sv:32" *) 4'h2;
  assign _066_ = ! (* full_case = 32'd1 *) (* src = "design.sv:34|design.sv:32" *) state;
  function [7:0] _146_;
    input [7:0] a;
    input [23:0] b;
    input [2:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:132|design.sv:32" *)
    (* parallel_case *)
    casez (s)
      3'b??1:
        _146_ = b[7:0];
      3'b?1?:
        _146_ = b[15:8];
      3'b1??:
        _146_ = b[23:16];
      default:
        _146_ = a;
    endcase
  endfunction
  assign _014_ = _146_(tx_reg, { address, rd_wr, _018_, _025_ }, { _070_, _062_, _059_ });
  assign _059_ = state == (* full_case = 32'd1 *) (* src = "design.sv:132|design.sv:32" *) 4'h9;
  assign _010_ = _070_ ? (* full_case = 32'd1 *) (* src = "design.sv:43|design.sv:32" *) rd_wr : mode;
  assign _062_ = state == (* full_case = 32'd1 *) (* src = "design.sv:77|design.sv:32" *) 4'h5;
  function [2:0] _150_;
    input [2:0] a;
    input [5:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:148|design.sv:32" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _150_ = b[2:0];
      2'b1?:
        _150_ = b[5:3];
      default:
        _150_ = a;
    endcase
  endfunction
  assign _008_ = _150_(count, { _029_[2:0], 3'h0 }, { _038_, _031_ });
  assign _068_ = state == (* full_case = 32'd1 *) (* src = "design.sv:148|design.sv:32" *) 4'hb;
  assign _073_ = state == (* full_case = 32'd1 *) (* src = "design.sv:140|design.sv:32" *) 4'ha;
  assign _074_ = state == (* full_case = 32'd1 *) (* src = "design.sv:113|design.sv:32" *) 4'h7;
  assign _065_ = state == (* full_case = 32'd1 *) (* src = "design.sv:60|design.sv:32" *) 4'h3;
  assign _070_ = state == (* full_case = 32'd1 *) (* src = "design.sv:43|design.sv:32" *) 4'h1;
  assign _009_ = _072_ ? (* full_case = 32'd1 *) (* src = "design.sv:156|design.sv:32" *) tx_reg : dout;
  assign _072_ = state == (* full_case = 32'd1 *) (* src = "design.sv:156|design.sv:32" *) 4'hc;
  assign _004_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 1'h1 : _012_;
  assign _003_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 1'h1 : _011_;
  assign _005_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 4'h0 : _013_;
  assign _000_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 3'h0 : _008_;
  assign _006_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) tx_reg : _014_;
  assign _002_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) mode : _010_;
  assign _001_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) dout : _009_;
  function [0:0] _165_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _165_ = b[0:0];
      2'b1?:
        _165_ = b[1:1];
      default:
        _165_ = a;
    endcase
  endfunction
  assign _025_[5] = _165_(1'hx, { SDA, tx_reg[5] }, { _053_, _037_ });
  function [0:0] _166_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:134" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _166_ = b[0:0];
      2'b1?:
        _166_ = b[1:1];
      default:
        _166_ = a;
    endcase
  endfunction
  assign _025_[3] = _166_(1'hx, { SDA, tx_reg[3] }, { _055_, _035_ });
  wire [7:0] _170_ = tx_reg;
  assign _076_ = _170_[_050_ +: 1];
  assign SDA = sda ? (* src = "design.sv:186" *) 1'hz : 1'h0;
  assign SCL = scl ? (* src = "design.sv:187" *) 1'hz : 1'h0;
endmodule
