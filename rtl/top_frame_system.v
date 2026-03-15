module top_frame_system(

    input clk,
    input rst

);

// connections between modules

wire [14:0] write_addr;
wire [7:0]  write_data;
wire        we;

wire [14:0] read_addr;
wire [7:0]  read_data;


// write controller
write_fsm write_controller(

    .clk(clk),
    .rst(rst),

    .write_addr(write_addr),
    .write_data(write_data),
    .we(we)

);


// frame buffer memory
frame_buffer frame_mem(

    .clk(clk),

    .write_addr(write_addr),
    .write_data(write_data),
    .we(we),

    .read_addr(read_addr),
    .read_data(read_data)

);


// read controller
read_fsm read_controller(

    .clk(clk),
    .rst(rst),

    .read_addr(read_addr),
    .read_data(read_data)

);

endmodule