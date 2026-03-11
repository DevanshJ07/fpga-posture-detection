module frame_buffer (
    input clk,

    // write port
    input we,
    input [14:0] write_addr,
    input [7:0] write_data,

    // read port
    input [14:0] read_addr,
    output reg [7:0] read_data
);

reg [7:0] frame_mem [0:19199];

always @(posedge clk)
begin
    if (we)
        frame_mem[write_addr] <= write_data;

    read_data <= frame_mem[read_addr];
end

endmodule