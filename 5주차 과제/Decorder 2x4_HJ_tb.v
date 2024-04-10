`timescale 1ns / 1ps

module decoder2x4_tb;

  reg [1:0] i;
  wire [3:0] d;

  decoder2x4 uut (
    .i(i), 
    .d(d)
  );

  initial begin
    i = 2'b00; #10;
    i = 2'b01; #10;
    i = 2'b10; #10;
    i = 2'b11; #10;
    $finish;
  end
  
  initial begin
    $monitor("시간=%g, 입력 i=%b, 출력 d=%b", $time, i, d);
  end

endmodule
