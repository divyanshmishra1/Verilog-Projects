module demux2x1_tb ();
    reg A, S;
    wire Y0, Y1;

    demux2x1 dut(.A(A), .S(S), .Y0(Y0), .Y1(Y1));

    initial begin
        $dumpfile("demux2X1.vcd");
        $dumpvars(0,demux2x1_tb);
    end

    initial begin
        A = 1'b0; S = 1'b0;
        $monitor("T = %2d, A = %b, S = %b, Y0 = %b, Y1 = %b", $time, A, S, Y0, Y1);
        #10 A = 1'b1; S = 1'b0;
        #10 A = 1'b1; S = 1'b1;
        #10 $finish; 
    end

endmodule