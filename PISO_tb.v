`timescale 1ns/1ps

module piso_tb ();
    reg clk, rst, load;
    reg[3:0] parallel_in;
    wire serial_out;

    piso dut(.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .serial_out(serial_out));

    initial begin
        $dumpfile("piso.vcd");
        $dumpvars(0,piso_tb);
    end

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $monitor("t = %8t, CLK = %b, RST = %b, LOAD = %b, Parallel_in = %4b, Serial_out = %b", $time, clk, rst, load, parallel_in, serial_out);
        #10 rst = 1; load = 0; parallel_in = 4'b0000;
        #10 rst = 0;

        load = 1; parallel_in = 4'b1011; #10;
        load = 0;
        #50;
        $finish;
    end
endmodule