module demux4x1_tb ();
    reg A;
    reg[1:0] S;
    wire Y0, Y1, Y2, Y3;

    demux4x1 dut(.A(A), .S(S), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3));

    initial begin
        $dumpfile("demux4X1.vcd");
        $dumpvars(0,demux4x1_tb);
    end

    initial begin
        A = 1'b0; S = 1'b0;
        $monitor("T = %2d, A = %b, S = %b, Y0 = %b, Y1 = %b, Y2 = %b, Y3 = %b", $time, A, S, Y0, Y1, Y2, Y3);
        #10 A = 1'b1; S = 2'b00;
        #10 A = 1'b1; S = 2'b01;
        #10 A = 1'b1; S = 2'b10;
        #10 A = 1'b1; S = 2'b11;
        #10 $finish; 
    end

endmodule