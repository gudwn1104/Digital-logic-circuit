module truth_table_logic(
    input a,
    input b,
    input c,
    output p
);

wire not_a, not_b, not_c;
wire and1, and2, and3;

// 입력의 NOT 게이트
not (not_a, a);
not (not_b, b);
not (not_c, c);

// 각 조건에 대한 AND 게이트
and (and1, not_a, b, c);     // \overline{a}bc
and (and2, a, not_b, not_c); // a\overline{b}\overline{c}
and (and3, a, b, c);         // abc

// OR 게이트로 최종 출력 결정
or (p, and1, and2, and3);

endmodule
