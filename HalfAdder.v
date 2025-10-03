    module halfadder(
    input  wire  A,
    input  wire B,
    output wire C,
    output wire Sum
    );

    assign Sum = A ^ B;
    assign C = A & B;
    endmodule   