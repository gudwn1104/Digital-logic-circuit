`timescale 1ns / 1ps

module parity_gudwn_tb;

// 입력
reg a;
reg b;
reg c;

// 출력
wire p;

// 테스트 대상 유닛(UUT) 인스턴스화
truth_table uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .p(p)
);

initial begin
    // 입력 초기화
    a = 0;
    b = 0;
    c = 0;

    // 글로벌 리셋이 끝나기를 100 ns 기다림
    #100;
    
    // 시뮬레이션 스티뮬러스 추가
    $display("ABC | P"); // 헤더 출력
    $monitor("%b%b%b | %b", a, b, c, p); // 입력 및 출력 모니터링
    
    // 각 입력 조합에 대해 테스트
    #10 {a, b, c} = 3'b000;
    #10 {a, b, c} = 3'b001;
    #10 {a, b, c} = 3'b010;
    #10 {a, b, c} = 3'b011;
    #10 {a, b, c} = 3'b100;
    #10 {a, b, c} = 3'b101;
    #10 {a, b, c} = 3'b110;
    #10 {a, b, c} = 3'b111;
    
    #10 $finish; // 시뮬레이션 종료
end

endmodule
