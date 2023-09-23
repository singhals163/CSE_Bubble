/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This document contains the various types of multiplexers used while implementing the processor.
*/

module mux_2to1_32bit(out, A, B, sel);

	output reg [31:0] out;
	input [31:0] A;
	input [31:0] B;
	input sel;

	always@(*) begin
		out = (sel==0) ? A : B;		
	end

endmodule

module mux_2to1_5bit(out, A, B, sel);

	output reg [4:0] out;
	input [4:0] A;
	input [4:0] B;
	input sel;

	always@(*) begin
		out = (sel==0) ? A : B;		
	end

endmodule

module mux_4to1_32bits(out, A, B, C, sel);
	input [1:0] sel;
	input wire [31:0] A, B, C;
	output reg [31:0] out;

	always @(*) begin
		case (sel)
			0: out = A;
			1: out = B;
			2: out = C; 
			default: out = 32'b0;
		endcase
	end
endmodule

module mux_4to1_5bits(out, A, B, sel);
	input [1:0] sel;
	input wire [4:0] A, B;
	output reg [4:0] out;

	always @(*) begin
		case (sel)
			0: out = A;
			1: out = B;
			2: out = 5'b11111; 
			default: out = 5'b0;
		endcase
	end
endmodule