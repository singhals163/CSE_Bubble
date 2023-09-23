/*
This is the work of Shivam Singhal (200939) and Shrey Wadhawan (200948) and contains the code deliverables for the CS220 Assignment-7.
*/

/*
This is the Data memory module which stores the data contents and it is written only on posedge of CLK.
*/

module Memory(input clk,
input [31:0] address,
input[31:0] data,
input write_en,
input read_en,
output [31:0] read
);

    parameter ROWS = 1024 , BITS = 32;
    reg [BITS-1:0] memory [ROWS-1:0];
    integer i;
    initial begin
        for(i=0;i<ROWS;i = i+1)
            memory[i] = 32'b0;
            memory[0] = 5;
            memory[1] = 7;
            memory[2] = 3;
            memory[3] = 9;
            memory[4] = 1;
            memory[5] = 7;
            memory[6] = 3;
            memory[7] = 9;
    end
    always @(posedge clk) begin
        if(write_en) begin
            memory[address] = data;
            $display("Written memory[%0d] = %0d", address, $signed(memory[address]));
        end
        $display("\nArray[0] = %0d, Array[1] = %0d, Array[2] = %0d, Array[3] = %0d, Array[4] = %0d, Array[5] = %0d, Array[6] = %0d, Array[7] = %0d, \n", memory[0], memory[1], memory[2], memory[3], memory[4], memory[5], memory[6], memory[7]);
    end
    assign read = (read_en == 1'b1) ? memory[address] : 32'b0;

endmodule