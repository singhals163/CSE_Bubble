/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This module is a ALU which only performs 32-bit addition for updation of program counter.
It is an instantation of the original MIPS_ALU module.
*/
`include "alu.v"

module Adder( A,B,out);

input [31:0] A;
input [31:0] B; 
output [31:0] out;
wire Zero;

mips_alu add(4'b0010, A, B, 5'b0, out, Zero);

endmodule