module jkff_tb ();
    reg clk, J, K;
    wire Q;

    jkff dut(.clk(clk), .J(J), .K(K), .Q(Q));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("jkff.vcd");
        $dumpvars(0,jkff_tb);
    end

    initial begin
        #10 J = 1'b0; K = 1'b0;
        $monitor("t = %8t, Clk = %b, J = %b, K = %b, Q = %b", $time, clk, J, K, Q);
        #10 J = 1'b0; K = 1'b0;
        #10 J = 1'b0; K = 1'b1;
        #10 J = 1'b1; K = 1'b0;
        #10 J = 1'b1; K = 1'b1;

        #40 $finish;
    end
endmodule