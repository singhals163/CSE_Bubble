/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the main ALU module which takes in two 32-bit operands and performs the appropriate arithmetic operation.
*/
module mips_alu(input [3:0] ALUctrl, input [31:0] A, input [31:0] B, input [4:0] shamt, output reg [31:0] ALUout, output wire zero);

assign zero = (ALUout==0);

always @(*) begin
    case (ALUctrl)
        0:  ALUout <= A&B;
        1:  ALUout <= A|B;
        2:  ALUout <= A+B;
        3:  ALUout <= (A-B==0);
        4:  ALUout <= (A<B)? 0:1;
        5:  ALUout <= (A<=B)? 0:1;
        6:  ALUout <= A-B;
        7:  ALUout <= (A<B)?1:0;
        8:  ALUout <= (A<=B)? 1:0;
        10: ALUout <= B<<shamt; //sll
        11: ALUout <= B>>shamt; //slr
        12: ALUout <= ~(A|B);
        default: ALUout<= 0;
    endcase
end
endmodule
