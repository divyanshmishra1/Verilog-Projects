`timescale 1ps/1ps

module ripplecarryadder_4bit_tb ();
    reg[3:0] a, b;
    reg Cin;
    wire Cout;
    wire[3:0] Sum;  

    ripplecarryadder_4bit uut(.a(a), .b(b), .Cin(Cin), .Cout(Cout), .Sum(Sum));

    initial begin
        $dumpfile("ripplecarryadder.vcd");
        $dumpvars(0,ripplecarryadder_4bit_tb);
    end

    initial begin
        $monitor("Time = %t, A = %b, B = %b, Cin = %b, Cout = %b, Sum = %b", $time, a, b, Cin, Cout, Sum);
        a = 4'b0000; b = 4'b0000; Cin = 1'b0;
        #10 a = 4'b0001; b = 4'b0001; Cin = 1'b0; 
        #10 a = 4'b0011; b = 4'b0101; Cin = 1'b0; 
        #10 a = 4'b0101; b = 4'b0001; Cin = 1'b1; 
        #10 a = 4'b1101; b = 4'b0101; Cin = 1'b1; 
        #10 a = 4'b0101; b = 4'b0111; Cin = 1'b0; 
        #10 $finish;
    end

endmodule


