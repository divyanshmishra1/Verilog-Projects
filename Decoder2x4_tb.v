module decoder4x2_tb ();
reg[1:0] in;
wire[3:0] out;

decoder4x2 dut(.in(in), .out(out));

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder4x2_tb);
end

initial begin
    in = 2'b00;
    $monitor("t = %2d, in = %4b, out = %2b", $time, in , out);
    #10 in = 2'b00; 
    #10 in = 2'b01; 
    #10 in = 2'b10; 
    #10 in = 2'b11;
    #10 $finish; 
end
    
endmodule