module tff (
    input clk, reset, t,
    output reg q
);

always @(posedge clk) begin
    if(reset) begin
        q <= 1'b0;
    end
    else q <= ~t;
end
    
endmodule