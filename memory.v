module single_port_sync_ram #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 16
)(
    input  wire                   clk,
    input  wire                   cs,     
    input  wire                   we,    
    input  wire                   oe,   
    input  wire [ADDR_WIDTH-1:0]  addr,
    input  wire [DATA_WIDTH-1:0]  data_in,
    output reg  [DATA_WIDTH-1:0]  data_out
);

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (cs && we) begin
        mem[addr] <= data_in;
    end
    if (cs && !we) begin
        data_out <= mem[addr];
    end
end

assign data = cs & oe & ! we ? tmp_data : 'hz;

endmodule




