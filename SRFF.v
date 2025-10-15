module srff (
    input clk, S, R, reset,
    output reg q
);

always @(posedge clk) begin
    if (reset) begin
        q <= 1'b0;
    end
    else begin
        case ({S,R})
            2'b10:q <= 1'b1; 
            2'b01:q <= 1'b0;
            default: q <= q;
        endcase
    end
end
    
endmodule