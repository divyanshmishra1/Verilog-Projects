module dff (
    input wire clk, d,
    output qbar, 
    output reg q
);

always @(posedge clk) begin
    q <= d;
end
assign qbar = ~q;


endmodule