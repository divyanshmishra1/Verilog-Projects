module mux2x1_tb ();
    reg A, B, S;
    wire Y;
    mux2x1 dut(.A(A), .B(B), .S(S), .Y(Y));

    initial begin
        $dumpfile("mux2x1.vcd");
        $dumpvars(0, mux2x1_tb);
    end

    initial begin
        A = 0; B = 0; S = 0;
        $monitor("t = %0t | A = %b B = %b S = %b => Y = %b", $time, A, B, S, Y);
        #10 A = 1; B = 0; S = 0;
        #10 A = 1; B = 0; S = 1;
        #10 $finish;
    end
endmodule
