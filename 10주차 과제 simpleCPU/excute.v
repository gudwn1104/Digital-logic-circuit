module execute(
    input i_clk,
    input i_reset,
    input [3:0] i_opcode,
    input [7:0] i_srcdata1,
    input [7:0] i_srcdata2,
    input [3:0] i_destadd,
    output reg o_write_en,
    output reg [3:0] o_write_add,
    output reg [7:0] o_write_data
);

localparam ADD = 4'b0001,
           SUB = 4'b0010,
           LSHIFT = 4'b0100,
           RSHIFT = 4'b1000;

always @(posedge i_clk or negedge i_reset) begin
    if (!i_reset) begin
        o_write_en <= 1'b0;
        o_write_add <= 4'h0;
        o_write_data <= 8'h0;
    end else begin
        o_write_add <= i_destadd;
        case (i_opcode)
            ADD: o_write_data <= i_srcdata1 + i_srcdata2;
            SUB: o_write_data <= i_srcdata1 - i_srcdata2;
            LSHIFT: o_write_data <= i_srcdata1 << 1;
            RSHIFT: o_write_data <= i_srcdata1 >> 1;
            default: o_write_data <= 8'h0;
        endcase
        o_write_en <= (o_write_data != 8'h0);
    end
end

endmodule
