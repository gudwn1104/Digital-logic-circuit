module Parity(
    input a,
    input b,
    input c,
    output reg p
);

always @(a or b or c) begin
    case({a, b, c})
        3'b000: p = 0;
        3'b001: p = 1;
        3'b010: p = 0;
        3'b011: p = 1;
        3'b100: p = 1;
        3'b101: p = 0;
        3'b110: p = 0;
        3'b111: p = 1;
        default: p = 0; // 기본값 설정
    endcase
end

endmodule
