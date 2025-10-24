module siso (
    input clk, Rst,
    input serial_in,
    output reg serial_out
);
    reg B, C, D;

    always @(posedge clk, posedge Rst) begin
        if(Rst == 1'b1) begin
            serial_out = 1'b0;
            B <= 1'b0;
            C <= 1'b0;
            D <= 1'b0;
        end
        else begin
            serial_out = B;
            B <= C;
            C <= D;
            D <= serial_in;
            
        end
    end
endmodule


// 4-bit Serial In Serial Out Shift Register
/*
module SISO (
    input clk,
    input rst,
    input serial_in,
    output serial_out
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    assign serial_out = shift_reg[3];
endmodule
*/