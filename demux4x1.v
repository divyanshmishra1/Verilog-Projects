module demux4x1 (
    input wire A,
    input wire[1:0] S,
    output wire Y0, Y1, Y2, Y3
);

assign Y0  = (S == 2'b00) ? A : 1'b0;
assign Y1  = (S == 2'b01) ? A : 1'b0;
assign Y2  = (S == 2'b10) ? A : 1'b0;
assign Y3  = (S == 2'b11) ? A : 1'b0;

    
endmodule