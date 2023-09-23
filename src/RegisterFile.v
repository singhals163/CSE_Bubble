/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This file implement the Register File used for reading/writing contents from/to the registers.
*/

module RegFile(ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, Clk, ReadData1, ReadData2);

input [4:0] ReadReg1,ReadReg2,WriteReg;
input [31:0] WriteData;
input RegWrite,Clk;

output wire [31:0] ReadData1,ReadData2;

reg [31:0] Regs [0:31];

initial begin
    Regs[0] <= 32'h00000000; //Zero Register
    Regs[1] <= 32'h00000001;
    Regs[2] <= 32'h00000002;
    Regs[3] <= 32'h00000000;
    Regs[4] <= 32'h00000000;
    Regs[5] <= 32'h00000000;
    Regs[6] <= 32'h00000000;
    Regs[7] <= 32'h00000000;
    Regs[8] <= 32'h00000000;
    Regs[9] <= 32'h00000000;
    Regs[10] <= 32'h00000000;
    Regs[11] <= 32'h00000000;
    Regs[12] <= 32'h00000000;
    Regs[13] <= 32'h00000000;
    Regs[14] <= 32'h00000000;
    Regs[15] <= 32'h00000000;
    Regs[16] <= 32'h00000000;
    Regs[17] <= 32'h00000000;
    Regs[18] <= 32'h00000000;
    Regs[19] <= 32'h00000000;
    Regs[20] <= 32'h00000000;
    Regs[21] <= 32'h00000000;
    Regs[22] <= 32'h00000000;
    Regs[23] <= 32'h00000000;
    Regs[24] <= 32'h00000000;
    Regs[25] <= 32'h00000000;
    Regs[26] <= 32'h00000000;
    Regs[27] <= 32'h00000000;
    Regs[28] <= 32'h00000000;
    Regs[29] <= 32'h00000000;
    Regs[30] <= 32'h00000000;
    Regs[31] <= 32'h00000000; //return address
end


always @(posedge Clk)
begin
    if (RegWrite == 1) 
    begin
        Regs[WriteReg] = WriteData;
        $display("changed register[%0d] value: %0d", WriteReg, $signed(Regs[WriteReg]));
    end
end


assign ReadData1 = Regs[ReadReg1];
assign ReadData2 = Regs[ReadReg2];

// always @(*)
    // $display("Readdata1 = %d, readdata2 = %d", ReadData1, ReadData2);

endmodule