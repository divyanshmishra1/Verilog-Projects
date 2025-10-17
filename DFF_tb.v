module dff_tb (    
);
reg clk, d;
wire q, qbar;

dff dut(.clk(clk), .d(d), .q(q), .qbar(qbar));

initial begin
    clk  = 1'b0;
    forever #5 clk = ~clk;  
end
initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb);
end

initial begin
    d = 1'b0;
    $monitor("t = %8t, clk = %b, d = %b , q = %b, qbar = %b", $time, clk, d, q, qbar);
    #10 d = 1'b1;
    #10 d = 1'b0;
    #40 $finish;
end
    
endmodule