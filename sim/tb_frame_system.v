module tb_frame_system;

reg clk;
reg rst;

// instantiate the system
top_frame_system uut (

    .clk(clk),
    .rst(rst)

);

// clock generation
always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;

    #20
    rst = 0;

    #500000

    $finish;

end

endmodule