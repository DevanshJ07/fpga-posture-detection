module read_fsm(
    input clk,
    input rst,

    output reg [14:0] read_addr,
    input [7:0] read_data
);

reg [1:0] state;

localparam IDLE  = 2'd0;
localparam READ  = 2'd1;
localparam DONE  = 2'd2;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= IDLE;
        read_addr <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            read_addr <= 0;
            state <= READ;
        end

        READ:
        begin
            if (read_addr == 19199)
                state <= DONE;
            else
                read_addr <= read_addr + 1;
        end

        DONE:
        begin
            // hold
        end

        endcase
    end
end

endmodule