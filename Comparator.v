module comparator(input wire[3:0] A, B, output reg equal, less_than, greater_than);
always @(A,B) begin 
    if(A == B) begin 
        equal = 1'b1;
        less_than = 1'b0;
        greater_than  = 1'b0;
    end
    else if (A > B) begin 
        greater_than  = 1'b1;
        less_than = 1'b0;
        equal = 1'b0;
    end
    else begin
        less_than = 1'b1;
        greater_than = 1'b0;
        equal = 1'b0;
    end
end

endmodule
