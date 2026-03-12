
module write_fsm(
    input clk,
    input rst,

    output reg we,
    output reg [14:0] write_addr,
    output reg [7:0] write_data
=======
module read_fsm(
    input clk,
    input rst,

    output reg [14:0] read_addr,
    input [7:0] read_data
>>>>>>> 147b4fd57b1f4b6b772c09bfb540a59aa4c606fd
);

reg [1:0] state;

localparam IDLE  = 2'd0;
localparam WRITE = 2'd1;
=======
localparam READ  = 2'd1;
>>>>>>> 147b4fd57b1f4b6b772c09bfb540a59aa4c606fd
localparam DONE  = 2'd2;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= IDLE;
        write_addr <= 0;
        write_data <= 0;
        we <= 0;

        read_addr <= 0;
    end

    else
    begin
        case(state)

        IDLE:
        begin
            write_addr <= 0;
            state <= WRITE;
        end

        WRITE:
        begin
            we <= 1;
            write_data <= write_addr[7:0]; // simple pattern

            if (write_addr == 19199)
                state <= DONE;
            else
                write_addr <= write_addr + 1;

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
            we <= 0;
            // hold last state

        end

        endcase
    end
end

endmodule

endmodule
