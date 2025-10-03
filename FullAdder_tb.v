module fulladder_tb ();
reg A, B, Cin;
wire Cout, Sum;

fulladder uut(.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));

initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladder_tb);
end

initial begin
    $monitor("t = %2d, A = %b, B = %b, Cin = %b, Cout = %b, Sum = %b", $time, A, B, Cin, Cout, Sum);
    A = 1'b0; B = 1'b0; Cin = 1'b0;
    #10 A = 1'b0; B = 1'b0; Cin = 1'b1;
    #10 A = 1'b0; B = 1'b1; Cin = 1'b0;
    #10 A = 1'b0; B = 1'b1; Cin = 1'b1;
    #10 A = 1'b1; B = 1'b0; Cin = 1'b0;
    #10 A = 1'b1; B = 1'b0; Cin = 1'b1;
    #10 A = 1'b1; B = 1'b1; Cin = 1'b0;
    #10 A = 1'b1; B = 1'b1; Cin = 1'b1;
    #10 $finish;
end

endmodule
