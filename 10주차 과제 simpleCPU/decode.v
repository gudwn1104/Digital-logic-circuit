module decode(
    input [15:0] i_instruction,
    output [3:0] o_opcode,
    output [3:0] o_srcadd1,
    output [3:0] o_srcadd2,
    output [3:0] o_destadd
);

reg [3:0] opcode, src1, src2, dest;

always @(*) begin
    opcode = i_instruction[15:12];
    src1 = i_instruction[11:8];
    src2 = i_instruction[7:4];
    dest = i_instruction[3:0];
end

assign o_opcode = opcode;
assign o_srcadd1 = src1;
assign o_srcadd2 = src2;
assign o_destadd = dest;

endmodule
