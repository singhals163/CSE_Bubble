/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the final testbench module used for simulating the processor CSE-BUBBLE.
*/

`include "Processor.v"
`timescale 1ns/1ns

module CSE_Bubble_tb;

reg clk;
Processor processor(clk);

always begin
    clk = ~clk;
    #10;
end

initial begin
    $dumpfile("CSE_Bubble.vcd");
    $dumpvars(0, CSE_Bubble_tb);
    clk = 1'b0;
    #6810
    $finish;
end

initial $monitor("time = %0t, clk = %0b", $time, clk);

endmodule