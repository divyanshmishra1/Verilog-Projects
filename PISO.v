`timescale 1ns/1ps

module piso (
    input clk, rst, load,
    input wire[ 3:0] parallel_in,
    output serial_out
 );

 reg[3:0] shift_reg;

 always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <=4'b0000;
    end
    else if (load) begin
        shift_reg <= parallel_in;
    end
    else begin
        shift_reg <= {1'b0,shift_reg[3:1]};
    end
 end

 assign serial_out = shift_reg[0];
    
endmodule