`timescale 1ps/1ps

module ripplecarryadder_4bit (
    input wire[3:0] a, b,
    input wire Cin,
    output wire[3:0] Sum, 
    output wire Cout
);

wire[2:0] w;

fulladder a1(.A(a[0]), .B(b[0]), .Cin(Cin),  .Cout(w[0]), .Sum(Sum[0]));
fulladder a2(.A(a[1]), .B(b[1]), .Cin(w[0]), .Cout(w[1]), .Sum(Sum[1]));
fulladder a3(.A(a[2]), .B(b[2]), .Cin(w[1]), .Cout(w[2]), .Sum(Sum[2]));
fulladder a4(.A(a[3]), .B(b[3]), .Cin(w[2]), .Cout(Cout), .Sum(Sum[3]));
    
endmodule


module fulladder (
    input wire A, B, Cin,
    output wire Cout, Sum
);

assign Cout = (A & B) | (B & Cin) | (A & Cin);
assign Sum  = A^B^Cin;
    
endmodule

