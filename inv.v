`timescale 1ns/1ps

module inv (
    input A,
    output B
);

assign B  = ~A;
    
endmodule