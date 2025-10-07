module graytobin_tb ();
    reg[3:0] gray;
    wire[3:0] bin;
    integer i;

    graytobin dut(.gray(gray), .bin(bin));

    initial begin
        $dumpfile("graytobin.vcd");
        $dumpvars(0,graytobin_tb);
    end

    initial begin
        gray = 4'b0000;
        #10;
        $display("Gray Value  |   Binary Value", gray, bin);
        for(i = 0; i<16; i = i + 1) begin
             $display("%4b  |    %4b",gray , bin);
            gray = gray + 1;
            #10;
        end
        $finish;
    end
endmodule