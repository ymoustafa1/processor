module decoder
  (input  [4:0] write_sel,
   input  write_ena,
   output [31:0] sel);
  wire [31:0] temp;
  wire [4:0] shift_amount;
  wire [30:0] n3;
  wire [31:0] n4;
  assign sel = n4; //(module output)
  /*# decoder.vhd:14:8 */
  assign temp = 32'b00000000000000000000000000000001; // (signal)
  /*# decoder.vhd:15:8 */
  assign shift_amount = write_sel; // (signal)
  /*# decoder.vhd:20:53 */
  assign n3 = {26'b0, shift_amount};  // uext
  /*# decoder.vhd:20:25 */
  assign n4 = temp << n3;
endmodule

