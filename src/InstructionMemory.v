/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the Instruction Memory (having row-size = 8 bits) which stores the entire set of instructions to be executed.
*/
module Ins_Memory(Address, Instruction, clk); 

    input [31:0] Address;
	input clk; 
    output [31:0] Instruction;
    reg [7:0] mem[0:71];

	initial
	begin
	
		$readmemb("bubble_sort.txt",mem);
	end
	
	assign Instruction = {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]};	
	always @(*) $display("\nAddress = %0d, Instruction = %b", Address, Instruction);
	
endmodule