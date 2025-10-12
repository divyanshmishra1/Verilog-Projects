module GatedSRLatch (
    input wire En, S, R,
    output reg Q
);

initial Q = 1'b0;
always @(*) begin
    if(En == 1'b0) begin
        $display("Latch Not enabled");
    end
    else begin
        if(S == 1'b0 && R == 1'b0) begin
            $display("Q holding prev value");;
        end

        else if(S == 1'b0 && R == 1'b1) begin
            Q = 1'b0;
        end
        else if(S == 1'b1 && R == 1'b0) begin
            Q = 1'b1;
        end
        else begin
            $display("t = %2d, S = %b, R = %b,Race Condtiton -- Invalid Output",$time, S, R);
        end
    end
end
    
endmodule