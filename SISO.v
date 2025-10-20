module siso (
    input clk, Rst,
    input serial_in,
    output reg serial_out
);
    reg B, C, D;

    always @(posedge clk, posedge Rst) begin
        if(Rst == 1'b1) begin
            serial_out = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
        end
        else begin
            serial_out = B;
            B = C;
            C = D;
            D = serial_in;
            
        end
    end
endmodule