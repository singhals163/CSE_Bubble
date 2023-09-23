/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This file contains the program counter which is updated on each posedge of CLK.
*/
`include "Adder.v"
`include "MUX.v"

module PC(clk, PCoutput, PCinput);
	input clk;
	input wire [31:0] PCoutput;
	output reg [31:0] PCinput;

	initial PCinput = 0;
	always @(posedge clk)begin
		// $display("clk = %b, PCInput = %0d", clk, PCinput);
		PCinput = PCoutput;
	end
endmodule

module PC_updater(PCinput, Jump, Branch, jr_address, zero, branch_ins, jump_ins, jr_control, PCoutput, pcupdate);

	input [31:0]  PCinput;
	input Jump, Branch, zero, jr_control;
	input [31:0] branch_ins, jr_address;
	input [25:0] jump_ins;
	output [31:0] PCoutput;

	output reg  [31:0]  PCResult;

	output wire [31:0] pcupdate;
	Adder pc_next(PCinput, 32'h00000004, pcupdate);

	wire [31:0] jump_ins_out;
	wire [27:0] jump_ins_shift = jump_ins<<2;
	assign jump_ins_out = {pcupdate[31:28], jump_ins_shift};

	wire [31:0] branch_ins_out = branch_ins<<2;
	wire [31:0] branch_adder_out;
	Adder branch_next(pcupdate, branch_ins_out, branch_adder_out);

	wire branch_select = Branch & zero; 
	wire [31:0] branch_select_output;
	mux_2to1_32bit branch_mux(branch_select_output, pcupdate, branch_adder_out, branch_select);

	wire [31:0] temp_PC_out;
	mux_2to1_32bit jump_mux(temp_PC_out, branch_select_output, jump_ins_out, Jump);
	mux_2to1_32bit jr_mux(PCoutput, temp_PC_out, jr_address, jr_control);

endmodule