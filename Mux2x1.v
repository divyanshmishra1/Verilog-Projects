module mux2x1 (
    input wire A, B, S,
    output wire Y
);

assign Y = (S) ? B : A;

endmodule
