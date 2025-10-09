module mux4x1_tb ();
    reg[3:0] A;
    reg[1:0] S;
    wire Y;

    mux4x1 dut(.A(A), .S(S), .Y(Y));
    initial begin
        $dumpfile("mux4x1.vcd");
        $dumpvars(0,mux4x1_tb);
    end

    initial begin
        A = 4'b0000; S = 2'b00;
        $monitor("t = %2d, A  = %b, S = %b, Y = %b", $time, A, S, Y);
        #10 A = 4'b0000; S = 2'b00;
        #10 A = 4'b0010; S = 2'b01;
        #10 A = 4'b0100; S = 2'b10;
        #10 A = 4'b1000; S = 2'b11;
        #10 $finish;
    end
endmodule