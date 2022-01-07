module cactus (
        input vsync,
        input clk,
        input rst,
        input [9:0] h_cnt,
        input [9:0] v_cnt,
        input [1:0] state,
        output reg black_cactus
    );

    wire [7:0] rand_num;
    random rand1 (clk, rst, rand_num);

    reg [59:0] ptn0 [57:0];
    reg [59:0] ptn1 [57:0];
    reg [59:0] ptn2 [57:0];
    reg [9:0] cactus_position;
    reg [1:0] cactus_type;
    reg [9:0] wait_counter;
    reg [9:0] wait_time;

    always @(posedge vsync) begin
        wait_counter <= wait_counter +1;
        case
        endcase
    end


endmodule
