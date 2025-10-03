module halfadder_tb;
    reg[1:0] A, B;
    wire[1:0] C;
    wire[1:0]Sum;

halfadder uut(.A(A), .B(B), .C(C), .Sum(Sum));
initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0,halfadder_tb);
end

initial begin
    $monitor("t = %2d, A = %b, B = %b, C = %b, Sum = %b", $time, A, B, C, Sum);
    A = 2'b00; B = 2'b00;
    #10 A = 2'b00; B = 2'b01;
    #10 A = 2'b10; B = 2'b00;
    #10 A = 2'b11; B = 2'b11;
    #50 $finish;
end

endmodule