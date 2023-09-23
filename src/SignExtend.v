/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This file contains the code for extending the sign of a 16-bit value to a 32-bit value.
*/
module sign_extend(out, in, ExtendSign);

    output reg [31:0] out;
    input [15:0] in;
	input ExtendSign;

    always@(*)
	 begin
		if (ExtendSign == 0) begin
			out = {16'b0 , in};
		end 
        else begin
			  out = {16'hffff , in};
	     end
     end
endmodule