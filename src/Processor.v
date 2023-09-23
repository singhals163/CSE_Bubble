/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This file instantiates all the other modules and contains the overall implementation of the CSE-BUBBLE Processor.
*/

`include "aluctrl.v"
`include "Control.v"
`include "RegisterFile.v"
`include "InstructionMemory.v"
`include "SignExtend.v"
`include "ProgramCounter.v"
`include "DataMemory.v"

module Processor (
    input clk
);

wire [31:0] PCaddress_in, PCaddress_out, branch_ins, WriteData, rs, ReadData2, ALUout, Mem_out;
wire [31:0] Instruction, PCupdate;
wire Jump, Branch, MemRead, MemWrite, ALUSrc, RegWrite, zero, jr_control;
wire [1:0]ALUOp, RegDst, MemtoReg;

PC pc(clk, PCaddress_out, PCaddress_in);

Ins_Memory IMemory(PCaddress_in, Instruction, clk);

ControlUnit Control(Instruction[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp, jr_control);

wire [4:0] rd;
mux_4to1_5bits mmux2(rd, Instruction[20:16], Instruction[15:11], RegDst);
RegFile rfile(Instruction[25:21], Instruction[20:16], rd, WriteData, RegWrite, clk, rs, ReadData2);

wire [31:0] temp_rt;
sign_extend sign(temp_rt, Instruction[15:0], Instruction[15]);
assign branch_ins = temp_rt;

wire [31:0] rt;
mux_2to1_32bit mmux1(rt, ReadData2, temp_rt, ALUSrc);

wire [3:0] Arithmetic;
assignALUctrl ALUctrl(ALUOp, Instruction[31:26], Instruction[5:0], Arithmetic);

mips_alu ALU(Arithmetic, rs, rt, Instruction[10:6],ALUout,zero);

Memory Data_Memory(clk, ALUout, ReadData2, MemWrite, MemRead,Mem_out);

mux_4to1_32bits mem_mux(WriteData, ALUout, Mem_out, PCupdate, MemtoReg);

PC_updater pc_update(PCaddress_in, Jump, Branch, rs, zero, branch_ins, Instruction[25:0], jr_control, PCaddress_out, PCupdate);

always @(posedge clk)
 $display ("CLK = %b, rs = %d, rt = %d, ALUout = %d", clk, rs, rt, $signed(ALUout));

endmodule