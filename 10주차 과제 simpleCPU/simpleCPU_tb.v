`timescale 1ns / 1ps

module simpleCPU_tb;

// Inputs
reg clk;
reg reset;
reg halt;

// Outputs
wire [3:0] write_addr;
wire [7:0] write_data;

// Instantiate the Unit Under Test (UUT)
simpleCPU uut (
    .clk(clk),
    .reset(reset),
    .halt(halt),
    .write_addr(write_addr),
    .write_data(write_data)
);

initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;
    halt = 0;

    // Wait 100 ns for global reset to finish
    #100;
    reset = 1;

    // Add stimulus here
    #10 halt = 0;  // Start the fetch-execute cycle

    #200 halt = 1; // Stop the CPU after some operations

    // Complete the simulation
    #100 $finish;
end

// Clock generation
always #5 clk = ~clk; // Generate a clock with a 10 ns period (100 MHz)

endmodule
