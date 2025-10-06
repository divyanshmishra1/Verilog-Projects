module bintogray_tb (
);
reg[3:0] bin ;
wire[3:0] gray;
integer i;

bintogray dut(.bin(bin), .gray(gray));

initial begin
    $dumpfile("bintogray.vcd");
    $dumpvars(0,bintogray_tb);
end

initial begin
    bin = 4'b0001;
    $display("Binary Value  |   Gray Value");
    for(i = 0; i<16; i = i +1) begin
        $display("%4b  |    %4b",bin , gray);
        bin = bin + 1;
        #10;
    end
    $finish;
end
    
endmodule