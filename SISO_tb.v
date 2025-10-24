module siso_tb ();
  reg serial_in, clk, Rst;
  wire serial_out;

  siso dut(.clk(clk), .Rst(Rst), .serial_in(serial_in), .serial_out(serial_out));

  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0,siso_tb);

  end

  initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
  end


    initial begin
        $monitor("t = %8t, CLK =%b, RST = %b, Serial_IN = %b, Serial_out = %b", $time, clk, Rst, serial_in, serial_out);
        Rst = 1'b1; serial_in = 1'b0;
        #12 Rst = 1'b0;       // Release reset after a bit
        #10 serial_in = 1'b1;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b1;
        #40 $finish;
        end

    
endmodule



/*
`timescale 1ns / 1ps

module tb_SISO;
    reg clk, rst, serial_in;
    wire serial_out;

    // Instantiate the design under test (DUT)
    SISO uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Generate clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | serial_in=%b | serial_out=%b", $time, serial_in, serial_out);

        clk = 0; rst = 1; serial_in = 0;
        #10 rst = 0;

        // Shift in bits serially: 1,0,1,1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        #20;
        $finish;
    end
endmodule
*/