module tff_tb ();
    reg clk, reset, t;
    wire q;

    tff dut(.clk(clk), .reset(reset), .t(t), .q(q));

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("tff.vcd");
        $dumpvars(0,tff_tb);
    end
    initial begin
        $monitor("t = %8t, CLK = %b, reset = %b, t = %b, q = %b", $time, clk, reset, t, q);
        #10 t = 1'b0; reset = 0;
        #10 t = 1'b1; reset = 1;
        #10 t = 1'b1; reset = 0;
        #10 t = 1'b0; reset = 0;
        #10 $finish;
    end
endmodule