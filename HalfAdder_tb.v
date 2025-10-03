module halfadder_tb;
    reg A, B;
    wire C;
    wire Sum;

halfadder uut(.A(A), .B(B), .C(C), .Sum(Sum));
initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0,halfadder_tb);
end

initial begin
    $monitor("t = %2d, A = %b, B = %b, C = %b, Sum = %b", $time, A, B, C, Sum);
    A = 1'b0; B = 1'b0;
    #10 A = 1'b0; B = 1'b1;
    #10 A = 1'b1; B = 1'b0;
    #10 A = 1'b1; B = 1'b1;
    #10 $finish;

end

endmodule