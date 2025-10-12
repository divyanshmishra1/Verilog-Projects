    module GatedSRLatch_tb ();
        reg En, S, R;
        wire Q;

        GatedSRLatch dut(.En(En), .S(S), .R(R), .Q(Q));

        initial begin
            $dumpfile("GatedSRLatch.vcd");
            $dumpvars(0, Gatgit edSRLatch_tb);  
        end

        initial begin
            $monitor("t = %2d, En = %b, S = %b, R = %b, Q = %b", $time, En, S, R, Q);
            #10 En = 1'b0; S = 1'b0; R = 1'b0;
            #10 En = 1'b1; S = 1'b0; R = 1'b0;
            #10 En = 1'b1; S = 1'b0; R = 1'b1;
            #10 En = 1'b1; S = 1'b1; R = 1'b0;
            #10 En = 1'b1; S = 1'b1; R = 1'b1;
            #20 $finish;
        end
    endmodule