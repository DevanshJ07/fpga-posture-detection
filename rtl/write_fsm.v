module write_fsm(

    input clk,
    input rst,

    output reg [14:0] write_addr,
    output reg [7:0] write_data,
    output reg we

);

reg [1:0] state;

localparam IDLE  = 2'd0;
localparam WRITE = 2'd1;
localparam DONE  = 2'd2;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= IDLE;
        write_addr <= 0;
        we <= 0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            write_addr <= 0;
            we <= 1;
            state <= WRITE;
        end

        WRITE:
        begin
            write_data <= write_addr[7:0];

            if (write_addr == 19199)
            begin
                we <= 0;
                state <= DONE;
            end
            else
            begin
                write_addr <= write_addr + 1;
            end
        end

        DONE:
        begin
            we <= 0;
        end

        endcase
    end
end

endmodule