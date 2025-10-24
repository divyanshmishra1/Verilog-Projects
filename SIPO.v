module sipo (
    input clk, rst, serial_in,
    output wire[3:0] parallel_out
);

reg[3:0] serial_reg;

always @(posedge clk) begin
    if (rst == 1'b1) begin
        serial_reg = 4'b0000;
    end
    else begin
        serial_reg[0] <= serial_in;
        serial_reg[1] <= serial_reg[0];
        serial_reg[2] <= serial_reg[1];
        serial_reg[3] <= serial_reg[2];
    end
    
end

assign parallel_out = serial_reg;
    
endmodule   

/*
// 4-bit Serial In Parallel Out Shift Register
module SIPO (
    input clk,
    input rst,
    input serial_in,
    output [3:0] parallel_out
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    assign parallel_out = shift_reg;
endmodule
*/