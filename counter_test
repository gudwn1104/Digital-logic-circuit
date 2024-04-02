`timescale 1ns / 1ps

module counter_tb;

reg clk;
reg rst_n;
wire [3:0] cnt;

// 카운터 모듈 인스턴스화
counter uut(
    .clk(clk), 
    .rst_n(rst_n), 
    .cnt(cnt)
);

// 클록 생성
always #5 clk = ~clk;

initial begin
    // 초기화
    clk = 0;
    rst_n = 0; // 리셋 활성화
    
    // 리셋 후 카운터 시작
    #10 rst_n = 1; // 리셋 비활성화
    #100; // 충분한 시간을 두고 카운터 증가 확인
    
    $finish; // 시뮬레이션 종료
end

endmodule
