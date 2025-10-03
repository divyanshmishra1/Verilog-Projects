module fulladder (
input wire  A , B , Cin,
output wire Cout , Sum
);

assign Cout = A & B | B & Cin | Cin & A;
assign Sum = (A^B)^Cin;

endmodule