/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the main Control Unit which takes in input as the opcode of an instruction and asserts the various control signals
so as to perform the appropriate operation.
*/

module ControlUnit(input [5:0] opcode, output reg [1:0] RegDst, output reg Jump,output reg Branch,output reg MemRead,output reg [1:0]
 MemtoReg,output reg MemWrite,output reg ALUSrc,output reg RegWrite, output reg [1:0] ALUOp, output reg jr_control);

always @(*) begin
    case (opcode)
        0: 
        begin 
            ALUOp = 2'b0;
            Jump = 0;
            RegDst = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0; 
            ALUSrc = 0;
            RegWrite = 1;
            jr_control = 0;
        end
        1: 
        begin 
            ALUOp = 2'b10;
            Jump = 1;
            RegDst = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        2: 
        begin 
            ALUOp = 2'b10;
            Jump = 0;
            RegDst = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 1;
        end
        3:
        begin 
            ALUOp = 2'b10;
            Jump = 1;
            RegDst = 2;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 2;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 1;
            jr_control = 0;
        end
        4:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        5: 
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        6:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        7:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        8:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        9:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        10:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            jr_control = 0;
        end
        11:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 1;
            ALUSrc = 1;
            RegWrite = 0;
            jr_control = 0;
        end
        12:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 1;
            MemtoReg = 1;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        13:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        14:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        15:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        16:
        begin 
            ALUOp = 2'b01;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
            RegWrite = 1;
            jr_control = 0;
        end
        default: begin 
            ALUOp = 2'b11;
            RegDst = 0;
            Jump = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
        end
    endcase
end

// always @(*) $display("opcode = %d", opcode);

endmodule