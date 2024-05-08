module carry_ripple_adder(
    input [30] A,
    input [30] B,
    output [40] S
);

    wire [30] carry;

    full_adder fa0(
        .a(A[0]),
        .b(B[0]),
        .cin(1'b0),
        .sum(S[0]),
        .cout(carry[0])
    );

    full_adder fa1(
        .a(A[1]),
        .b(B[1]),
        .cin(carry[0]),
        .sum(S[1]),
        .cout(carry[1])
    );

    full_adder fa2(
        .a(A[2]),
        .b(B[2]),
        .cin(carry[1]),
        .sum(S[2]),
        .cout(carry[2])
    );

    full_adder fa3(
        .a(A[3]),
        .b(B[3]),
        .cin(carry[2]),
        .sum(S[3]),
        .cout(carry[3])
    );

    assign S[4] = carry[3];

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b)  (b & cin)  (cin & a);
endmodule
