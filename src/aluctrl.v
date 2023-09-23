/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the ALU Control Unit module which takes in input as the opcode and function value of a instruction and outputs 
the corresponding operation to be performed by the ALU.
*/

module assignALUctrl(input [1:0] ALUop, input [5:0] opcode, input [5:0] FUNCcode, output reg [3:0] ALUctrl);

wire [3:0] ALUctrl1, ALUctrl2;
rtypealuctrl R1(FUNCcode, ALUctrl1);
itypealuctrl I1(opcode, ALUctrl2);

always @(*) begin
    case (ALUop)
        0:  ALUctrl <= ALUctrl1;
        1:  ALUctrl <= ALUctrl2;
        default: ALUctrl <= 15;
    endcase
    // $display("ALUctrl = %d", ALUctrl);
end

endmodule

module rtypealuctrl(input [5:0] FUNCcode, output reg [3:0] ALUctrl);

always @(*) begin
    case (FUNCcode) 
        0:  ALUctrl <= 2;
        1:  ALUctrl <= 6;
        2:  ALUctrl <= 2;
        3:  ALUctrl <= 6;
        4:  ALUctrl <= 0;
        5:  ALUctrl <= 1;
        6:  ALUctrl <= 10;
        7:  ALUctrl <= 11;
        8:  ALUctrl <= 7;
        default: ALUctrl <= 15;
    endcase
end
endmodule

module itypealuctrl(input [5:0] opcode, output reg [3:0] ALUctrl);

always @(*) begin
    case (opcode)
        16: ALUctrl <= 2;
        15: ALUctrl <= 2;
        14: ALUctrl <= 0;
        13: ALUctrl <= 1;
        12: ALUctrl <= 2;
        11: ALUctrl <= 2;
        10: ALUctrl <= 6; 
        9:  ALUctrl <= 3; 
        8:  ALUctrl <= 8; 
        7:  ALUctrl <= 7; 
        6:  ALUctrl <= 4; 
        5:  ALUctrl <= 5; 
        4:  ALUctrl <= 7; 
        default: ALUctrl <= 15;
    endcase
end

endmodule

