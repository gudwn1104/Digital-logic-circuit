module fetch(
    input i_clk,
    input i_reset,
    input i_stop,
    output reg [11:0] o_pc
);

reg [11:0] next_pc;

always @(posedge i_clk or negedge i_reset) begin
    if (!i_reset) begin
        o_pc <= 12'h000;
        next_pc <= 12'h000;
    } else if (!i_stop) begin
        o_pc <= next_pc;
        next_pc <= next_pc + 12'h001;
    end
end

endmodule
