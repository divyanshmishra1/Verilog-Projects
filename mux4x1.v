module mux4x1 (
    input wire[3:0] A,
    input wire[1:0] S,
    output reg Y
);

always @ (*) begin
    case (S)
        2'b00 : Y = A[0];
        2'b01 : Y = A[1];
        2'b10 : Y = A[2];
        2'b11 : Y = A[3];
        default: Y = 1'bz;
    endcase
end
    
endmodule