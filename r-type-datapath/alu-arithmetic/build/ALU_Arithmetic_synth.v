module ALU_Arithmetic
  (input  [31:0] data1,
   input  [31:0] data2,
   input  [3:0] aluop,
   output [31:0] result);
  wire n4;
  wire [31:0] n5;
  wire n7;
  wire [31:0] n8;
  wire n10;
  wire n11;
  wire n14;
  localparam [31:0] n15 = 32'b00000000000000000000000000000000;
  wire [30:0] n16;
  wire [31:0] n17;
  wire [31:0] n19;
  wire [31:0] n20;
  wire [31:0] n21;
  assign result = n21; //(module output)
  /*# ALU_Arithmetic.vhd:17:18 */
  assign n4 = aluop == 4'b0010;
  /*# ALU_Arithmetic.vhd:18:53 */
  assign n5 = data1 + data2;
  /*# ALU_Arithmetic.vhd:19:21 */
  assign n7 = aluop == 4'b0110;
  /*# ALU_Arithmetic.vhd:20:52 */
  assign n8 = data1 - data2;
  /*# ALU_Arithmetic.vhd:21:20 */
  assign n10 = aluop == 4'b0111;
  /*# ALU_Arithmetic.vhd:23:30 */
  assign n11 = $signed(data1) < $signed(data2);
  /*# ALU_Arithmetic.vhd:23:13 */
  assign n14 = n11 ? 1'b1 : 1'b0;
  /*# ALU_Arithmetic.vhd:9:9 */
  assign n16 = n15[31:1]; // extract
  /*# ALU_Arithmetic.vhd:21:9 */
  assign n17 = {n16, n14};
  /*# ALU_Arithmetic.vhd:21:9 */
  assign n19 = n10 ? n17 : 32'b00000000000000000000000000000000;
  /*# ALU_Arithmetic.vhd:19:9 */
  assign n20 = n7 ? n8 : n19;
  /*# ALU_Arithmetic.vhd:17:9 */
  assign n21 = n4 ? n5 : n20;
endmodule

