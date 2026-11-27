module alu_arithmetic_Bbehaviour
  (input  [31:0] data1,
   input  [31:0] data2,
   input  [3:0] aluop,
   output [31:0] result);
  wire n312;
  wire [31:0] n313;
  wire n315;
  wire [31:0] n316;
  wire n318;
  wire n319;
  wire n322;
  localparam [31:0] n323 = 32'b00000000000000000000000000000000;
  wire [30:0] n324;
  wire [31:0] n325;
  wire [31:0] n327;
  wire [31:0] n328;
  wire [31:0] n329;
  assign result = n329; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:17:18 */
  assign n312 = aluop == 4'b0010;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:18:53 */
  assign n313 = data1 + data2;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:19:21 */
  assign n315 = aluop == 4'b0110;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:20:52 */
  assign n316 = data1 - data2;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:21:20 */
  assign n318 = aluop == 4'b0111;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:23:30 */
  assign n319 = $signed(data1) < $signed(data2);
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:23:13 */
  assign n322 = n319 ? 1'b1 : 1'b0;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:9:9 */
  assign n324 = n323[31:1]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:21:9 */
  assign n325 = {n324, n322};
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:21:9 */
  assign n327 = n318 ? n325 : 32'b00000000000000000000000000000000;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:19:9 */
  assign n328 = n315 ? n316 : n327;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu-arithmetic/ALU_Arithmetic.vhd:17:9 */
  assign n329 = n312 ? n313 : n328;
endmodule

module mux_Bbehaviour
  (input  [4:0] read_sel,
   input  [1023:0] inputs,
   output [31:0] data);
  wire [4:0] temp;
  wire [4:0] n304;
  wire [31:0] n307;
  assign data = n307; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/MUX.vhd:15:8 */
  assign temp = read_sel; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/MUX.vhd:18:19 */
  assign n304 = 5'b11111 - temp;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/MUX.vhd:18:19 */
  assign n307 = inputs[n304 * 32 +: 32]; //(Bmux)
endmodule

module d_register_32_Bbehaviour
  (input  c,
   input  [31:0] d,
   output [31:0] q);
  reg [31:0] n300;
  assign q = n300; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/D_Register_32.vhd:19:9 */
  always @(posedge c)
    n300 <= d;
endmodule

module decoder_Bbehaviour
  (input  write_ena,
   input  [4:0] write_sel,
   output [31:0] sel);
  wire [31:0] temp;
  wire [4:0] shift_amount;
  wire [30:0] n290;
  wire [31:0] n291;
  wire [31:0] n292;
  assign sel = n292; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/decoder.vhd:14:8 */
  assign temp = 32'b00000000000000000000000000000001; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/decoder.vhd:15:8 */
  assign shift_amount = write_sel; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/decoder.vhd:20:52 */
  assign n290 = {26'b0, shift_amount};  // uext
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/decoder.vhd:20:24 */
  assign n291 = temp << n290;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/decoder.vhd:20:67 */
  assign n292 = write_ena ? n291 : 32'b00000000000000000000000000000000;
endmodule

module alu_Bbehavioral
  (input  [31:0] data1,
   input  [31:0] data2,
   input  [3:0] aluop,
   output [31:0] dataout,
   output zflag);
  wire [31:0] arith_res;
  wire [31:0] result;
  wire [31:0] n260;
  wire n262;
  wire [31:0] n263;
  wire [31:0] n264;
  wire n266;
  wire [31:0] n267;
  wire [31:0] n268;
  wire n270;
  wire [31:0] n271;
  wire n273;
  wire n275;
  wire n276;
  wire n278;
  wire n279;
  wire [31:0] n280;
  wire n284;
  wire n285;
  assign dataout = result; //(module output)
  assign zflag = n285; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:16:12 */
  assign result = n263; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:19:5 */
  alu_arithmetic_Bbehaviour u_arith (
    .data1(data1),
    .data2(data2),
    .aluop(aluop),
    .result(arith_res));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:27:22 */
  assign n260 = data1 & data2;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:27:44 */
  assign n262 = aluop == 4'b0000;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:27:33 */
  assign n263 = n262 ? n260 : n267;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:28:28 */
  assign n264 = data1 | data2;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:28:50 */
  assign n266 = aluop == 4'b0001;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:27:53 */
  assign n267 = n266 ? n264 : n271;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:29:28 */
  assign n268 = ~(data1 | data2);
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:29:50 */
  assign n270 = aluop == 4'b1100;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:28:59 */
  assign n271 = n270 ? n268 : n280;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:30:43 */
  assign n273 = aluop == 4'b0010;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:30:61 */
  assign n275 = aluop == 4'b0110;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:30:52 */
  assign n276 = n273 | n275;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:30:79 */
  assign n278 = aluop == 4'b0111;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:30:70 */
  assign n279 = n276 | n278;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:29:59 */
  assign n280 = n279 ? arith_res : 32'b00000000000000000000000000000000;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:34:32 */
  assign n284 = result == 32'b00000000000000000000000000000000;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/alu/ALU.vhd:34:20 */
  assign n285 = n284 ? 1'b1 : 1'b0;
endmodule

module register_file_bb_Bbehaviour
  (input  write_ena,
   input  [4:0] write_sel,
   input  [31:0] write_data,
   input  [4:0] read_sel1,
   input  [4:0] read_sel2,
   input  clk,
   output [31:0] data1,
   output [31:0] data2);
  wire [1023:0] mux1_inputs;
  wire [1023:0] mux2_inputs;
  wire [31:0] dec_sel;
  wire [1023:0] reg_outputs;
  wire [31:0] decodera_n21;
  wire n24;
  wire n25;
  wire [31:0] \gen_registers[0]_registers_n26 ;
  wire [31:0] n29;
  wire [31:0] n30;
  wire n31;
  wire n32;
  wire [31:0] \gen_registers[1]_registers_n33 ;
  wire [31:0] n36;
  wire [31:0] n37;
  wire n38;
  wire n39;
  wire [31:0] \gen_registers[2]_registers_n40 ;
  wire [31:0] n43;
  wire [31:0] n44;
  wire n45;
  wire n46;
  wire [31:0] \gen_registers[3]_registers_n47 ;
  wire [31:0] n50;
  wire [31:0] n51;
  wire n52;
  wire n53;
  wire [31:0] \gen_registers[4]_registers_n54 ;
  wire [31:0] n57;
  wire [31:0] n58;
  wire n59;
  wire n60;
  wire [31:0] \gen_registers[5]_registers_n61 ;
  wire [31:0] n64;
  wire [31:0] n65;
  wire n66;
  wire n67;
  wire [31:0] \gen_registers[6]_registers_n68 ;
  wire [31:0] n71;
  wire [31:0] n72;
  wire n73;
  wire n74;
  wire [31:0] \gen_registers[7]_registers_n75 ;
  wire [31:0] n78;
  wire [31:0] n79;
  wire n80;
  wire n81;
  wire [31:0] \gen_registers[8]_registers_n82 ;
  wire [31:0] n85;
  wire [31:0] n86;
  wire n87;
  wire n88;
  wire [31:0] \gen_registers[9]_registers_n89 ;
  wire [31:0] n92;
  wire [31:0] n93;
  wire n94;
  wire n95;
  wire [31:0] \gen_registers[10]_registers_n96 ;
  wire [31:0] n99;
  wire [31:0] n100;
  wire n101;
  wire n102;
  wire [31:0] \gen_registers[11]_registers_n103 ;
  wire [31:0] n106;
  wire [31:0] n107;
  wire n108;
  wire n109;
  wire [31:0] \gen_registers[12]_registers_n110 ;
  wire [31:0] n113;
  wire [31:0] n114;
  wire n115;
  wire n116;
  wire [31:0] \gen_registers[13]_registers_n117 ;
  wire [31:0] n120;
  wire [31:0] n121;
  wire n122;
  wire n123;
  wire [31:0] \gen_registers[14]_registers_n124 ;
  wire [31:0] n127;
  wire [31:0] n128;
  wire n129;
  wire n130;
  wire [31:0] \gen_registers[15]_registers_n131 ;
  wire [31:0] n134;
  wire [31:0] n135;
  wire n136;
  wire n137;
  wire [31:0] \gen_registers[16]_registers_n138 ;
  wire [31:0] n141;
  wire [31:0] n142;
  wire n143;
  wire n144;
  wire [31:0] \gen_registers[17]_registers_n145 ;
  wire [31:0] n148;
  wire [31:0] n149;
  wire n150;
  wire n151;
  wire [31:0] \gen_registers[18]_registers_n152 ;
  wire [31:0] n155;
  wire [31:0] n156;
  wire n157;
  wire n158;
  wire [31:0] \gen_registers[19]_registers_n159 ;
  wire [31:0] n162;
  wire [31:0] n163;
  wire n164;
  wire n165;
  wire [31:0] \gen_registers[20]_registers_n166 ;
  wire [31:0] n169;
  wire [31:0] n170;
  wire n171;
  wire n172;
  wire [31:0] \gen_registers[21]_registers_n173 ;
  wire [31:0] n176;
  wire [31:0] n177;
  wire n178;
  wire n179;
  wire [31:0] \gen_registers[22]_registers_n180 ;
  wire [31:0] n183;
  wire [31:0] n184;
  wire n185;
  wire n186;
  wire [31:0] \gen_registers[23]_registers_n187 ;
  wire [31:0] n190;
  wire [31:0] n191;
  wire n192;
  wire n193;
  wire [31:0] \gen_registers[24]_registers_n194 ;
  wire [31:0] n197;
  wire [31:0] n198;
  wire n199;
  wire n200;
  wire [31:0] \gen_registers[25]_registers_n201 ;
  wire [31:0] n204;
  wire [31:0] n205;
  wire n206;
  wire n207;
  wire [31:0] \gen_registers[26]_registers_n208 ;
  wire [31:0] n211;
  wire [31:0] n212;
  wire n213;
  wire n214;
  wire [31:0] \gen_registers[27]_registers_n215 ;
  wire [31:0] n218;
  wire [31:0] n219;
  wire n220;
  wire n221;
  wire [31:0] \gen_registers[28]_registers_n222 ;
  wire [31:0] n225;
  wire [31:0] n226;
  wire n227;
  wire n228;
  wire [31:0] \gen_registers[29]_registers_n229 ;
  wire [31:0] n232;
  wire [31:0] n233;
  wire n234;
  wire n235;
  wire [31:0] \gen_registers[30]_registers_n236 ;
  wire [31:0] n239;
  wire [31:0] n240;
  wire n241;
  wire n242;
  wire [31:0] \gen_registers[31]_registers_n243 ;
  wire [31:0] n246;
  wire [31:0] n247;
  wire [31:0] mux1_n248;
  wire [31:0] mux2_n251;
  wire [1023:0] n254;
  wire [1023:0] n255;
  wire [1023:0] n256;
  assign data1 = mux1_n248; //(module output)
  assign data2 = mux2_n251; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:20:8 */
  assign mux1_inputs = n254; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:21:8 */
  assign mux2_inputs = n255; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:22:8 */
  assign dec_sel = decodera_n21; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:23:8 */
  assign reg_outputs = n256; // (signal)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:27:5 */
  decoder_Bbehaviour decodera (
    .write_ena(write_ena),
    .write_sel(write_sel),
    .sel(decodera_n21));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n24 = dec_sel[0]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n25 = clk & n24;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[0]_registers  (
    .c(n25),
    .d(write_data),
    .q(\gen_registers[0]_registers_n26 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n29 = reg_outputs[1023:992]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n30 = reg_outputs[1023:992]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n31 = dec_sel[1]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n32 = clk & n31;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[1]_registers  (
    .c(n32),
    .d(write_data),
    .q(\gen_registers[1]_registers_n33 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n36 = reg_outputs[991:960]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n37 = reg_outputs[991:960]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n38 = dec_sel[2]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n39 = clk & n38;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[2]_registers  (
    .c(n39),
    .d(write_data),
    .q(\gen_registers[2]_registers_n40 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n43 = reg_outputs[959:928]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n44 = reg_outputs[959:928]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n45 = dec_sel[3]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n46 = clk & n45;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[3]_registers  (
    .c(n46),
    .d(write_data),
    .q(\gen_registers[3]_registers_n47 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n50 = reg_outputs[927:896]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n51 = reg_outputs[927:896]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n52 = dec_sel[4]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n53 = clk & n52;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[4]_registers  (
    .c(n53),
    .d(write_data),
    .q(\gen_registers[4]_registers_n54 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n57 = reg_outputs[895:864]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n58 = reg_outputs[895:864]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n59 = dec_sel[5]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n60 = clk & n59;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[5]_registers  (
    .c(n60),
    .d(write_data),
    .q(\gen_registers[5]_registers_n61 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n64 = reg_outputs[863:832]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n65 = reg_outputs[863:832]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n66 = dec_sel[6]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n67 = clk & n66;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[6]_registers  (
    .c(n67),
    .d(write_data),
    .q(\gen_registers[6]_registers_n68 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n71 = reg_outputs[831:800]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n72 = reg_outputs[831:800]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n73 = dec_sel[7]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n74 = clk & n73;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[7]_registers  (
    .c(n74),
    .d(write_data),
    .q(\gen_registers[7]_registers_n75 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n78 = reg_outputs[799:768]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n79 = reg_outputs[799:768]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n80 = dec_sel[8]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n81 = clk & n80;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[8]_registers  (
    .c(n81),
    .d(write_data),
    .q(\gen_registers[8]_registers_n82 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n85 = reg_outputs[767:736]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n86 = reg_outputs[767:736]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n87 = dec_sel[9]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n88 = clk & n87;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[9]_registers  (
    .c(n88),
    .d(write_data),
    .q(\gen_registers[9]_registers_n89 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n92 = reg_outputs[735:704]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n93 = reg_outputs[735:704]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n94 = dec_sel[10]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n95 = clk & n94;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[10]_registers  (
    .c(n95),
    .d(write_data),
    .q(\gen_registers[10]_registers_n96 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n99 = reg_outputs[703:672]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n100 = reg_outputs[703:672]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n101 = dec_sel[11]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n102 = clk & n101;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[11]_registers  (
    .c(n102),
    .d(write_data),
    .q(\gen_registers[11]_registers_n103 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n106 = reg_outputs[671:640]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n107 = reg_outputs[671:640]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n108 = dec_sel[12]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n109 = clk & n108;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[12]_registers  (
    .c(n109),
    .d(write_data),
    .q(\gen_registers[12]_registers_n110 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n113 = reg_outputs[639:608]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n114 = reg_outputs[639:608]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n115 = dec_sel[13]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n116 = clk & n115;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[13]_registers  (
    .c(n116),
    .d(write_data),
    .q(\gen_registers[13]_registers_n117 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n120 = reg_outputs[607:576]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n121 = reg_outputs[607:576]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n122 = dec_sel[14]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n123 = clk & n122;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[14]_registers  (
    .c(n123),
    .d(write_data),
    .q(\gen_registers[14]_registers_n124 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n127 = reg_outputs[575:544]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n128 = reg_outputs[575:544]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n129 = dec_sel[15]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n130 = clk & n129;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[15]_registers  (
    .c(n130),
    .d(write_data),
    .q(\gen_registers[15]_registers_n131 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n134 = reg_outputs[543:512]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n135 = reg_outputs[543:512]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n136 = dec_sel[16]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n137 = clk & n136;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[16]_registers  (
    .c(n137),
    .d(write_data),
    .q(\gen_registers[16]_registers_n138 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n141 = reg_outputs[511:480]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n142 = reg_outputs[511:480]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n143 = dec_sel[17]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n144 = clk & n143;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[17]_registers  (
    .c(n144),
    .d(write_data),
    .q(\gen_registers[17]_registers_n145 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n148 = reg_outputs[479:448]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n149 = reg_outputs[479:448]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n150 = dec_sel[18]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n151 = clk & n150;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[18]_registers  (
    .c(n151),
    .d(write_data),
    .q(\gen_registers[18]_registers_n152 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n155 = reg_outputs[447:416]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n156 = reg_outputs[447:416]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n157 = dec_sel[19]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n158 = clk & n157;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[19]_registers  (
    .c(n158),
    .d(write_data),
    .q(\gen_registers[19]_registers_n159 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n162 = reg_outputs[415:384]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n163 = reg_outputs[415:384]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n164 = dec_sel[20]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n165 = clk & n164;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[20]_registers  (
    .c(n165),
    .d(write_data),
    .q(\gen_registers[20]_registers_n166 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n169 = reg_outputs[383:352]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n170 = reg_outputs[383:352]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n171 = dec_sel[21]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n172 = clk & n171;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[21]_registers  (
    .c(n172),
    .d(write_data),
    .q(\gen_registers[21]_registers_n173 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n176 = reg_outputs[351:320]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n177 = reg_outputs[351:320]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n178 = dec_sel[22]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n179 = clk & n178;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[22]_registers  (
    .c(n179),
    .d(write_data),
    .q(\gen_registers[22]_registers_n180 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n183 = reg_outputs[319:288]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n184 = reg_outputs[319:288]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n185 = dec_sel[23]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n186 = clk & n185;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[23]_registers  (
    .c(n186),
    .d(write_data),
    .q(\gen_registers[23]_registers_n187 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n190 = reg_outputs[287:256]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n191 = reg_outputs[287:256]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n192 = dec_sel[24]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n193 = clk & n192;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[24]_registers  (
    .c(n193),
    .d(write_data),
    .q(\gen_registers[24]_registers_n194 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n197 = reg_outputs[255:224]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n198 = reg_outputs[255:224]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n199 = dec_sel[25]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n200 = clk & n199;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[25]_registers  (
    .c(n200),
    .d(write_data),
    .q(\gen_registers[25]_registers_n201 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n204 = reg_outputs[223:192]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n205 = reg_outputs[223:192]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n206 = dec_sel[26]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n207 = clk & n206;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[26]_registers  (
    .c(n207),
    .d(write_data),
    .q(\gen_registers[26]_registers_n208 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n211 = reg_outputs[191:160]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n212 = reg_outputs[191:160]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n213 = dec_sel[27]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n214 = clk & n213;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[27]_registers  (
    .c(n214),
    .d(write_data),
    .q(\gen_registers[27]_registers_n215 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n218 = reg_outputs[159:128]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n219 = reg_outputs[159:128]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n220 = dec_sel[28]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n221 = clk & n220;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[28]_registers  (
    .c(n221),
    .d(write_data),
    .q(\gen_registers[28]_registers_n222 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n225 = reg_outputs[127:96]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n226 = reg_outputs[127:96]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n227 = dec_sel[29]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n228 = clk & n227;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[29]_registers  (
    .c(n228),
    .d(write_data),
    .q(\gen_registers[29]_registers_n229 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n232 = reg_outputs[95:64]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n233 = reg_outputs[95:64]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n234 = dec_sel[30]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n235 = clk & n234;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[30]_registers  (
    .c(n235),
    .d(write_data),
    .q(\gen_registers[30]_registers_n236 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n239 = reg_outputs[63:32]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n240 = reg_outputs[63:32]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:29 */
  assign n241 = dec_sel[31]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:37:18 */
  assign n242 = clk & n241;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:35:4 */
  d_register_32_Bbehaviour \gen_registers[31]_registers  (
    .c(n242),
    .d(write_data),
    .q(\gen_registers[31]_registers_n243 ));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:41:33 */
  assign n246 = reg_outputs[31:0]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:42:33 */
  assign n247 = reg_outputs[31:0]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:45:4 */
  mux_Bbehaviour mux1 (
    .read_sel(read_sel1),
    .inputs(mux1_inputs),
    .data(mux1_n248));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:51:4 */
  mux_Bbehaviour mux2 (
    .read_sel(read_sel2),
    .inputs(mux2_inputs),
    .data(mux2_n251));
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:20:8 */
  assign n254 = {n29, n36, n43, n50, n57, n64, n71, n78, n85, n92, n99, n106, n113, n120, n127, n134, n141, n148, n155, n162, n169, n176, n183, n190, n197, n204, n211, n218, n225, n232, n239, n246};
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:21:8 */
  assign n255 = {n30, n37, n44, n51, n58, n65, n72, n79, n86, n93, n100, n107, n114, n121, n128, n135, n142, n149, n156, n163, n170, n177, n184, n191, n198, n205, n212, n219, n226, n233, n240, n247};
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/register-file/register_file_BB.vhd:23:8 */
  assign n256 = {\gen_registers[0]_registers_n26 , \gen_registers[1]_registers_n33 , \gen_registers[2]_registers_n40 , \gen_registers[3]_registers_n47 , \gen_registers[4]_registers_n54 , \gen_registers[5]_registers_n61 , \gen_registers[6]_registers_n68 , \gen_registers[7]_registers_n75 , \gen_registers[8]_registers_n82 , \gen_registers[9]_registers_n89 , \gen_registers[10]_registers_n96 , \gen_registers[11]_registers_n103 , \gen_registers[12]_registers_n110 , \gen_registers[13]_registers_n117 , \gen_registers[14]_registers_n124 , \gen_registers[15]_registers_n131 , \gen_registers[16]_registers_n138 , \gen_registers[17]_registers_n145 , \gen_registers[18]_registers_n152 , \gen_registers[19]_registers_n159 , \gen_registers[20]_registers_n166 , \gen_registers[21]_registers_n173 , \gen_registers[22]_registers_n180 , \gen_registers[23]_registers_n187 , \gen_registers[24]_registers_n194 , \gen_registers[25]_registers_n201 , \gen_registers[26]_registers_n208 , \gen_registers[27]_registers_n215 , \gen_registers[28]_registers_n222 , \gen_registers[29]_registers_n229 , \gen_registers[30]_registers_n236 , \gen_registers[31]_registers_n243 };
endmodule

module rtypefields_Bbehavioral
  (input  [31:0] instr,
   input  regwrite,
   input  reset,
   output [4:0] read_sel1,
   output [4:0] read_sel2,
   output [4:0] write_sel,
   output write_ena);
  wire [4:0] n14;
  wire [4:0] n15;
  wire [4:0] n16;
  wire n17;
  wire n18;
  assign read_sel1 = n14; //(module output)
  assign read_sel2 = n15; //(module output)
  assign write_sel = n16; //(module output)
  assign write_ena = n18; //(module output)
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/instruction-fields/RTypeFields.vhd:22:23 */
  assign n14 = instr[25:21]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/instruction-fields/RTypeFields.vhd:23:23 */
  assign n15 = instr[20:16]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/instruction-fields/RTypeFields.vhd:24:23 */
  assign n16 = instr[15:11]; // extract
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/instruction-fields/RTypeFields.vhd:26:31 */
  assign n17 = ~reset;
  /*# /Users/jo/Documents/Codex/2026-11-23/make-this-a-local-github-on-5/processor/r-type-datapath/instruction-fields/RTypeFields.vhd:26:27 */
  assign n18 = regwrite & n17;
endmodule

module Datapath
  (input  clk,
   input  reset,
   input  regwrite,
   input  [31:0] instr,
   input  [3:0] aluoperation,
   output zero,
   output [31:0] aluout);
  wire [4:0] rs_wire;
  wire [4:0] rt_wire;
  wire [4:0] rd_wire;
  wire enable_wire;
  wire [31:0] data1_wire;
  wire [31:0] data2_wire;
  wire [31:0] \alu.dataout ;
  assign aluout = \alu.dataout ; //(module output)
  /*# Datapath.vhd:25:5 */
  rtypefields_Bbehavioral fields (
    .instr(instr),
    .regwrite(regwrite),
    .reset(reset),
    .read_sel1(rs_wire),
    .read_sel2(rt_wire),
    .write_sel(rd_wire),
    .write_ena(enable_wire));
  /*# Datapath.vhd:36:5 */
  register_file_bb_Bbehaviour regfile (
    .write_ena(enable_wire),
    .write_sel(rd_wire),
    .write_data(\alu.dataout ),
    .read_sel1(rs_wire),
    .read_sel2(rt_wire),
    .clk(clk),
    .data1(data1_wire),
    .data2(data2_wire));
  /*# Datapath.vhd:48:5 */
  alu_Bbehavioral alu (
    .data1(data1_wire),
    .data2(data2_wire),
    .aluop(aluoperation),
    .dataout(\alu.dataout ),
    .zflag(zero));
endmodule

