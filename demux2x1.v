module demux2x1 (
    input wire A, S,
    output wire Y0, Y1
);

assign Y1  = S ? A : 1'b0;
assign Y0  = S ? 1'b0 : A;
    
endmodule