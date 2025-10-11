module encoder4x2_tb ();
reg[3:0] in;
wire[1:0] out;

encoder4x2 dut(.in(in), .out(out));

initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0,encoder4x2_tb);
end

initial begin
    in = 4'b0000;
    $monitor("t = %2d, in = %4b, out = %2b", $time, in , out);
    #10 in = 4'b0000; 
    #10 in = 4'b0001; 
    #10 in = 4'b0010; 
    #10 in = 4'b0011;
    #10 $finish; 
end
    
endmodule