    module halfadder (
    input  wire [1:0] A,
    input  wire[1:0] B,
    output wire[1:0] C,
    output wire[1:0] Sum
    );

    assign Sum = A ^ B;
    assign C = A & B;
    endmodule   