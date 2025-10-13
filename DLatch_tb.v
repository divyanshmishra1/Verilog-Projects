module dlatch_tb ();
    reg En, D;
    wire Q, Qbar;

    dlatch dut(.En(En), .D(D), .Q(Q), .Qbar(Qbar));
    initial begin
        $dumpfile("dlatch.vcd");
        $dumpvars(0,dlatch_tb);
    end

    initial begin
        $monitor("t = %2d, En = %b, D = %b, Q = %b, Qbar = %b", $time, En, D, Q, Qbar);
        #10 En = 1'b0; D = 1'b0;
        #10 En = 1'b0; D = 1'b1;
        #10 En = 1'b1; D = 1'b0;
        #10 En = 1'b1; D = 1'b1;
        #10 $finish;
    end

endmodule