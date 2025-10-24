module sipo_tb ();
    reg clk, rst, serial_in;
    wire[3:0] parallel_out;

    sipo dut(.clk(clk), .rst(rst), .serial_in(serial_in), .parallel_out(parallel_out));

    initial begin
        $dumpfile("sipo.vcd");
        $dumpvars(0,sipo_tb);
    end

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $monitor("t = %8t, CLK = %b, RST = %b, Serial_in = %b, Parallel_out = %4b", $time, clk, rst, serial_in, parallel_out);
        #10 serial_in = 0; rst = 1'b1;
        #10 serial_in = 0; rst = 1'b0;
        #10 serial_in = 1; rst = 1'b0;
        #10 serial_in = 0; rst = 1'b0;
        #10 serial_in = 1; rst = 1'b0;
        #10 serial_in = 0; rst = 1'b1;
        #10 $finish;
        
    end

endmodule


/*
`timescale 1ns / 1ps

module tb_SIPO;
    reg clk, rst, serial_in;
    wire [3:0] parallel_out;

    SIPO uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | serial_in=%b | parallel_out=%b", $time, serial_in, parallel_out);

        clk = 0; rst = 1; serial_in = 0;
        #10 rst = 0;

        // Serial input sequence
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        #20;
        $finish;
    end
endmodule

*/