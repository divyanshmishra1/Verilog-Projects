    module dlatch (
        input wire En, D,
        output reg Q,
        output Qbar
    );

    assign Qbar = ~Q;

    always @(D, En) begin
        if (En) begin
            Q <= D;
        end
    end
        
    endmodule