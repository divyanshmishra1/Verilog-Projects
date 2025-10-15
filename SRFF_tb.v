module srff_tb ();
    reg clk, S, R, reset;
    wire q;

    srff dut(.clk(clk), .S(S), .R(R), .reset(reset), .q(q));

    initial begin
        $dumpfile("srff.vcd");
        $dumpvars(0,srff_tb);
    end
    initial begin
        clk = 0;
       forever #5 clk = ~clk;
    end

    initial begin
        
        #10 S = 1'b0; R = 1'b0; reset = 1'b0;
        $monitor("t = %2d, Clk = %b, S = %b, R = %b, Reset = %b, Q = %b", $time, clk, S, R, reset, q);
        #15 S = 1'b1; R = 1'b0; reset = 1'b1;
        #10 S = 1'b1; R = 1'b0; reset = 1'b0;
        #10 S = 1'b0; R = 1'b1; reset = 1'b0;
        #10 S = 1'b1; R = 1'b1; reset = 1'b0;
        #10 S = 1'b1; R = 1'b0; reset = 1'b0;
        #20 $finish;
    end
endmodule