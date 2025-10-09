`timescale 1ns/1ps

module inv_tb ();
    reg A;
    wire B;

    inv dut(.A(A), .B(B));
    initial begin
        $dumpfile("inv.vcd");
        $dumpvars(0,inv_tb);
    end

    initial begin
        $monitor("t = %2d, A = %b, B = %b", $time, A, B);
        A = 0;
        #10 A = 1;
        #10 A = 0;
        #10 A = 1;
        #10 $finish;
    end

endmodule