module spi_master(clk, start, MISO, reset, din, mode, MOSI, SS, SCLK);
  (* src = "design.sv:20" *)
  wire _00_;
  (* src = "design.sv:20" *)
  wire _01_;
  (* src = "design.sv:20" *)
  wire _02_;
  (* src = "design.sv:20" *)
  wire [2:0] _03_;
  (* src = "design.sv:20" *)
  wire [7:0] _04_;
  (* src = "design.sv:20" *)
  wire [2:0] _05_;
  (* src = "design.sv:20" *)
  wire _06_;
  (* src = "design.sv:20" *)
  wire _07_;
  (* src = "design.sv:20" *)
  wire _08_;
  (* src = "design.sv:20" *)
  wire [2:0] _09_;
  (* src = "design.sv:20" *)
  wire [7:0] _10_;
  (* src = "design.sv:20" *)
  wire _11_;
  (* src = "design.sv:20" *)
  wire _12_;
  (* src = "design.sv:20" *)
  wire [7:0] _13_;
  (* src = "design.sv:20" *)
  wire _14_;
  (* src = "design.sv:20" *)
  wire _15_;
  (* src = "design.sv:20" *)
  wire [7:0] _16_;
  (* src = "design.sv:51" *)
  (* unused_bits = "3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  (* src = "design.sv:48" *)
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire [2:0] _29_;
  wire [2:0] _30_;
  wire [2:0] _31_;
  wire [2:0] _32_;
  (* src = "design.sv:4" *)
  input MISO;
  (* src = "design.sv:7" *)
  output MOSI;
  reg MOSI;
  (* src = "design.sv:7" *)
  output SCLK;
  reg SCLK;
  (* src = "design.sv:7" *)
  output SS;
  reg SS;
  (* src = "design.sv:4" *)
  input clk;
  (* src = "design.sv:12" *)
  reg [2:0] count;
  (* src = "design.sv:5" *)
  input [7:0] din;
  (* src = "design.sv:11" *)
  reg [7:0] memory;
  (* src = "design.sv:6" *)
  input [1:0] mode;
  (* src = "design.sv:4" *)
  input reset;
  (* src = "design.sv:4" *)
  input start;
  (* src = "design.sv:9" *)
  reg [2:0] state;
  assign _17_ = count + (* src = "design.sv:51" *) 32'd1;
  assign _18_ = | { _23_, _24_ };
  assign _19_ = | { _23_, _24_, _28_ };
  assign _20_ = | { _23_, _28_ };
  assign _21_ = | { _23_, _25_ };
  assign _22_ = count == (* src = "design.sv:48" *) 3'h7;
  always @(posedge clk)
      MOSI <= _00_;
  always @(posedge clk)
      SS <= _02_;
  always @(posedge clk)
      SCLK <= _01_;
  always @(posedge clk)
      state <= _05_;
  always @(posedge clk)
      memory <= _04_;
  always @(posedge clk)
      count <= _03_;
  function [0:0] _45_;
    input [0:0] a;
    input [3:0] b;
    input [3:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:68|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      4'b???1:
        _45_ = b[0:0];
      4'b??1?:
        _45_ = b[1:1];
      4'b?1??:
        _45_ = b[2:2];
      4'b1???:
        _45_ = b[3:3];
      default:
        _45_ = a;
    endcase
  endfunction
  assign _06_ = _45_(MOSI, { din[0], _11_, _14_, 1'hz }, { _27_, _26_, _25_, _19_ });
  function [7:0] _46_;
    input [7:0] a;
    input [23:0] b;
    input [2:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:46|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      3'b??1:
        _46_ = b[7:0];
      3'b?1?:
        _46_ = b[15:8];
      3'b1??:
        _46_ = b[23:16];
      default:
        _46_ = a;
    endcase
  endfunction
  assign _10_ = _46_(memory, { din, _13_, _16_ }, { _27_, _26_, _25_ });
  function [0:0] _47_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:68|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _47_ = b[0:0];
      2'b1?:
        _47_ = b[1:1];
      default:
        _47_ = a;
    endcase
  endfunction
  assign _07_ = _47_(SCLK, { _12_, _15_ }, { _26_, _21_ });
  function [0:0] _48_;
    input [0:0] a;
    input [1:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:68|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _48_ = b[0:0];
      2'b1?:
        _48_ = b[1:1];
      default:
        _48_ = a;
    endcase
  endfunction
  assign _08_ = _48_(SS, 2'h1, { _27_, _18_ });
  assign _23_ = state == (* full_case = 32'd1 *) (* src = "design.sv:68|design.sv:25" *) 3'h5;
  assign _24_ = state == (* full_case = 32'd1 *) (* src = "design.sv:62|design.sv:25" *) 3'h4;
  assign _03_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) count : _09_;
  assign _04_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) memory : _10_;
  assign _01_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) SCLK : _07_;
  assign _02_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) SS : _08_;
  assign _00_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) MOSI : _06_;
  assign _29_ = _22_ ? (* full_case = 32'd1 *) (* src = "design.sv:48" *) 3'h4 : 3'h2;
  function [2:0] _57_;
    input [2:0] a;
    input [11:0] b;
    input [3:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:46|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      4'b???1:
        _57_ = b[2:0];
      4'b??1?:
        _57_ = b[5:3];
      4'b?1??:
        _57_ = b[8:6];
      4'b1???:
        _57_ = b[11:9];
      default:
        _57_ = a;
    endcase
  endfunction
  assign _30_ = _57_(3'h0, { _31_, 6'h13, _29_ }, { _28_, _27_, _26_, _25_ });
  assign _25_ = state == (* full_case = 32'd1 *) (* src = "design.sv:46|design.sv:25" *) 3'h3;
  assign _26_ = state == (* full_case = 32'd1 *) (* src = "design.sv:38|design.sv:25" *) 3'h2;
  assign _27_ = state == (* full_case = 32'd1 *) (* src = "design.sv:32|design.sv:25" *) 3'h1;
  assign _31_ = start ? (* full_case = 32'd1 *) (* src = "design.sv:27" *) 3'h1 : 3'h0;
  assign _28_ = ! (* full_case = 32'd1 *) (* src = "design.sv:26|design.sv:25" *) state;
  assign _05_ = reset ? (* full_case = 32'd1 *) (* src = "design.sv:22" *) 3'h5 : _30_;
  assign _16_ = mode[0] ? (* full_case = 32'd1 *) (* src = "design.sv:56" *) { MISO, memory[7:1] } : memory;
  assign _14_ = mode[0] ? (* full_case = 32'd1 *) (* src = "design.sv:56" *) MOSI : memory[0];
  assign _15_ = mode[1] ? (* full_case = 32'd1 *) (* src = "design.sv:54" *) 1'h1 : 1'h0;
  assign _13_ = mode[0] ? (* full_case = 32'd1 *) (* src = "design.sv:42" *) memory : { MISO, memory[7:1] };
  assign _11_ = mode[0] ? (* full_case = 32'd1 *) (* src = "design.sv:42" *) memory[0] : MOSI;
  assign _12_ = mode[1] ? (* full_case = 32'd1 *) (* src = "design.sv:40" *) 1'h0 : 1'h1;
  function [2:0] _70_;
    input [2:0] a;
    input [5:0] b;
    input [1:0] s;
    (* full_case = 32'd1 *)
    (* src = "design.sv:68|design.sv:25" *)
    (* parallel_case *)
    casez (s)
      2'b?1:
        _70_ = b[2:0];
      2'b1?:
        _70_ = b[5:3];
      default:
        _70_ = a;
    endcase
  endfunction
  assign _09_ = _70_(count, { _32_, 3'h0 }, { _25_, _20_ });
  assign _32_ = _22_ ? (* full_case = 32'd1 *) (* src = "design.sv:48" *) count : _17_[2:0];
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////
module spi_slave(SCLK, MOSI, SS, din, mode, MISO);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  (* src = "design.sv:6" *)
  output MISO;
  (* src = "design.sv:3" *)
  input MOSI;
  (* src = "design.sv:3" *)
  input SCLK;
  (* src = "design.sv:3" *)
  input SS;
  (* src = "design.sv:4" *)
  input [7:0] din;
  (* src = "design.sv:8" *)
  reg [7:0] memory;
  (* src = "design.sv:9" *)
  reg misoreg;
  (* src = "design.sv:5" *)
  input [1:0] mode;
  assign _01_ = ~ (* src = "design.sv:18" *) SCLK;
  assign _03_ = ~ (* src = "design.sv:18" *) _20_;
  assign _04_ = ~ (* src = "design.sv:18" *) _19_;
  assign _05_ = ~ (* src = "design.sv:18" *) _24_;
  assign _06_ = ~ (* src = "design.sv:18" *) _23_;
  assign _07_ = | (* src = "design.sv:18" *) { _27_, _28_ };
  assign _08_ = | (* src = "design.sv:18" *) { _19_, _20_ };
  assign _11_ = | (* src = "design.sv:18" *) { SCLK, _21_ };
  assign _13_ = | (* src = "design.sv:18" *) { _23_, _24_ };
  assign _15_ = | (* src = "design.sv:18" *) { _22_, _25_ };
  assign _17_ = | (* src = "design.sv:18" *) { SCLK, _26_ };
  assign _09_ = _01_ & (* src = "design.sv:18" *) _08_;
  assign _10_ = _01_ & (* src = "design.sv:18" *) _09_;
  assign _21_ = _01_ & (* src = "design.sv:18" *) _10_;
  assign _12_ = _01_ & (* src = "design.sv:18" *) _11_;
  assign _22_ = _01_ & (* src = "design.sv:18" *) _12_;
  assign _14_ = SCLK & (* src = "design.sv:18" *) _13_;
  assign _25_ = SCLK & (* src = "design.sv:18" *) _14_;
  assign _16_ = _03_ & (* src = "design.sv:18" *) _04_;
  assign _26_ = _01_ & (* src = "design.sv:18" *) _16_;
  assign _27_ = _01_ & (* src = "design.sv:18" *) _17_;
  assign _18_ = _05_ & (* src = "design.sv:18" *) _06_;
  assign _28_ = SCLK & (* src = "design.sv:18" *) _18_;
  always @*
    if (_02_)
      misoreg = memory[0];
  assign _02_ = ~ _15_;
  always @*
    if (_00_)
      memory = { MOSI, memory[7:1] };
  assign _00_ = ~ _07_;
  always @(negedge SS)
      memory <= din;
  always @(negedge SS)
      misoreg <= din[0];
  assign _19_ = mode == (* full_case = 32'd1 *) (* src = "design.sv:37|design.sv:34" *) 2'h1;
  assign _20_ = mode == (* full_case = 32'd1 *) (* src = "design.sv:36|design.sv:34" *) 2'h2;
  assign _23_ = mode == (* full_case = 32'd1 *) (* src = "design.sv:25|design.sv:21" *) 2'h3;
  assign _24_ = ! (* full_case = 32'd1 *) (* src = "design.sv:22|design.sv:21" *) mode;
  assign MISO = SS ? (* src = "design.sv:10" *) 1'hz : misoreg;
endmodule