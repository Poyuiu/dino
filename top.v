module onepulse(s, s_op, clk);
    input s, clk;
    output reg s_op;
    reg s_delay;
    always@(posedge clk) begin
        s_op <= s&(!s_delay);
        s_delay <= s;
    end
endmodule

module debounce(s, s_db, clk);
    input s, clk;
    output s_db;
    reg [3:0] DFF;

    always@(posedge clk) begin
        DFF[3:1] <= DFF[2:0];
        DFF[0] <= s;
    end
    assign s_db = (DFF == 4'b1111)? 1'b1 : 1'b0;
endmodule

module top(
        input clk,
        input btnL,
        input btnC,
        inout wire PS2_DATA,
        inout wire PS2_CLK,
        output [3:0] vgaRed,
        output [3:0] vgaGreen,
        output [3:0] vgaBlue,
        output hsync,
        output vsync,
        output [15:0] led
    );

    wire clk_25MHz;
    wire clk_1Hz;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire [11:0] data;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    wire black_ground;
    wire black_dino;
    wire black_cactus;
    wire black_score;
    reg [1:0] state;
    reg [1:0] next_state;

    wire jump_db;
    wire jump_op;
    wire rst_db;
    wire rst_op;

    parameter [8:0] Q_CODES = 9'b0_0001_0101; // q => 15
    parameter [8:0] SPACE_CODES = 9'b0_0010_1001; // space => 29
    parameter [8:0] UP_CODES = 9'b0_0111_0101; // up => E075
    parameter [8:0] DOWN_CODES = 9'b0_0111_0010; // down => E072

    reg [15:0] nums;
    reg [3:0] key_num;
    reg [9:0] last_key;

    wire shift_down;
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;
    assign jump_op =
           (key_down[UP_CODES] == 1'b1 || key_down[SPACE_CODES] == 1'b1)
           ? 1'b1 : 1'b0;
    KeyboardDecoder key_de (
                        .key_down(key_down),
                        .last_change(last_change),
                        .key_valid(been_ready),
                        .PS2_DATA(PS2_DATA),
                        .PS2_CLK(PS2_CLK),
                        .rst(rst_op),
                        .clk(clk)
                    );
    //debounce db(btnC, jump_op, clk);
    // onepulse op(jump_db, jump_op, clk_1Hz);
    debounce db2(btnL, rst_db, clk);
    onepulse op2(rst_db, rst_op, clk_1Hz);

    assign led[0] = jump_op;
    assign led[2:1] = state;
    assign led[3] = valid;

    clock_divider #(2) clk_div_2(
                      .clk_d(clk_25MHz),
                      .clk(clk)
                  );

    clock_divider #(22) clk_div_22 (
                      .clk_d(clk_1Hz),
                      .clk(clk)
                  );

    ground gr(
               .h_cnt(h_cnt),
               .v_cnt(v_cnt),
               .vsync(vsync),
               .rst(rst_op),
               .clk(clk),
               .state(state),
               .black_ground(black_ground)
           );

    jump jp (
             .vsync(vsync),
             .clk(clk),
             .jump_op(jump_op),
             .rst(rst_op),
             .h_cnt(h_cnt),
             .v_cnt(v_cnt),
             .state(state),
             .black_dino(black_dino)
         );
    cactus ct(
               .vsync(vsync),
               .clk(clk),
               .rst(rst_op),
               .h_cnt(h_cnt),
               .v_cnt(v_cnt),
               .state(state),
               .black_cactus(black_cactus)
           );
    score sc(
              .clk(clk),
              .rst(rst_op),
              .h_cnt(h_cnt),
              .v_cnt(v_cnt),
              .state(state),
              .jump_op(jump_op),
              .black_score(black_score)
          );
    /*blk_mem_gen_0 blk_mem_gen_0_inst(
                      .clka(clk_25MHz),
                      .wea(0),
                      .addra(pixel_addr),
                      .dina(data[11:0]),
                      .douta(pixel)
                  );*/

    pixel_gen pixel_gen_inst(
                  .h_cnt(h_cnt),
                  .v_cnt(v_cnt),
                  .black_ground(black_ground),
                  .black_dino(black_dino),
                  .black_cactus(black_cactus),
                  .black_score(black_score),
                  .valid(valid),
                  .vgaRed(vgaRed),
                  .vgaGreen(vgaGreen),
                  .vgaBlue(vgaBlue)
              );

    vga_controller   vga_inst(
                         .pclk(clk_25MHz),
                         .reset(rst_op),
                         .hsync(hsync),
                         .vsync(vsync),
                         .valid(valid),
                         .h_cnt(h_cnt),
                         .v_cnt(v_cnt)
                     );
    always @(posedge clk) begin
        if (rst_op) begin
            state <= 2'b0;
        end
        else begin
            state <= next_state;
        end
    end
    always @(*) begin
        case (state)
            2'b00: begin
                if (jump_op)
                    next_state = 2'b01;
                else
                    next_state = 2'b0;
            end
            2'b01: begin
                // todo
                if(black_dino == 1'b1 && black_cactus == 1'b1)
                    next_state = 2'b11;
                else
                    next_state = 2'b01;
            end
            2'b10: begin
                // todo
                next_state = 2'b10;
            end
            default:
                next_state = 2'b11;
        endcase
    end
endmodule
