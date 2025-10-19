module comparator_tb ();
    reg[3:0] A, B;
    wire equal, less_than, greater_than;
    comparator dut(.A(A), .B(B), .equal(equal), .less_than(less_than), .greater_than(greater_than));

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0,comparator_tb);
    end
    initial begin
        $monitor("t = %8t, A = %b, B = %b, Equal = %b, Less_than = %b, Greater_than = %b",$time, A, B, equal, less_than, greater_than);
        #10 A = 4'b000; B = 4'b0000;
        #10 A = 4'b1000; B = 4'b1000;
        #10 A = 4'b1000; B = 4'b0100;
        #10 A = 4'b1001; B = 4'b1010;
        #10 A = 4'b0100; B = 4'b0001;
        #10 A = 4'b010; B = 4'b0110;
        #10 A = 4'b1111; B = 4'b1100;
        #10 $finish;
    end

endmodule