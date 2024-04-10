`timescale 1ns / 1ps
module mux4x1_tb;

reg [3:0] i;
reg [1:0] s;
wire y;
reg clk;

initial begin
    clk = 0;
    i = 4'b0000;
    s = 2'b00;
    forever #10 clk = ~clk;
end

initial begin
    s = 2'b00;
    #5; 
    i = 4'b1010; 
    #10; 
    $display("Test Case 1: s=00, i=%b, y=%b", i, y);

    s = 2'b01;
    #5;
    i = 4'b0101;
    #10;
    $display("Test Case 2: s=01, i=%b, y=%b", i, y);

    s = 2'b10;
    #5;
    i = 4'b1100;
    #10;
    $display("Test Case 3: s=10, i=%b, y=%b", i, y);

    s = 2'b11;
    #5;
    i = 4'b0011;
    #10;
    $display("Test Case 4: s=11, i=%b, y=%b", i, y);

    s = 2'b10;
    #5;
    i = 4'b1111;
    #10;
    $display("Additional Test Case: Invalid s value, i=%b, y=%b", i, y);
end

mux4x1 mux_inst (.i(i), .s(s), .y(y));

endmodule
