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
        input clk, // clock
        input btnC, // center button on FPGA
        inout wire PS2_DATA, // for keyboard
        inout wire PS2_CLK, // for keyboard
        output [3:0] vgaRed, // for VGA
        output [3:0] vgaGreen, // for VGA
        output [3:0] vgaBlue, // for VGA
        output hsync, // for VGA
        output vsync, // for VGA
        output [15:0] led // LEDs on FPGA
    );
    
    // game states
    parameter INITIAL = 2'b00;
    parameter PLAY = 2'b01;
    parameter Q_LEARNING = 2'b10;
    parameter DEAD = 2'b11;

    wire clk_25MHz; // for VGA
    wire clk_1Hz; // for reset button one pulse
    wire valid; // for pixel gen and VGA
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    wire black_ground; // is the current pixel part of ground?
    wire black_dino; // is the current pixel part of dino?
    wire black_cactus; // is the current pixel part of cactus?
    wire black_score; // is the current pixel part of score?
    wire [9:0] cactus_position; // cactus's position, right to left (i.e. rightmost is 0, leftmost is 640)
    wire [1:0] cactus_type; // cactus's type, 0 if there is no cactus
    wire success_jump; // raise to 1 for one clock cycle if jumped successfully
    wire jumping; // is dino currently jumping?
    wire prediction; // bot's prediction
    wire new_frame; // frame rate clock
    reg [1:0] Qstate; // Q state for updating Q table, 0 means no updates
    reg [1:0] next_Qstate;
    reg [1:0] Qstate_between; // we record Q state updates in between frames, and raise Qstate at the beginning of the next frame

    reg [1:0] state; // game state
    reg [1:0] next_state;
    reg [1:0] last_state;

    wire jump; // pressed space or up arrow
    wire Q_down; // pressed q
    wire rst_db; // reset debounced
    wire rst_op; // reset one pulsed

    // keyboard
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
 
    KeyboardDecoder key_de (
                        .key_down(key_down),
                        .last_change(last_change),
                        .key_valid(been_ready),
                        .PS2_DATA(PS2_DATA),
                        .PS2_CLK(PS2_CLK),
                        .rst(rst_op),
                        .clk(clk)
                    );
                    
    assign jump = (key_down[UP_CODES] == 1'b1 || key_down[SPACE_CODES] == 1'b1) ? 1'b1 : 1'b0;
    onepulse op1 (key_down[Q_CODES], Q_down, new_frame); // keep Q_down raised for a full frame

    // reset
    debounce db(btnC, rst_db, clk);
    onepulse op2(rst_db, rst_op, clk_1Hz);
    
    // frame clock
    onepulse op3 (vsync, new_frame, clk);

    wire [3:0] debug;
    assign led[0] = jump;
    assign led[1] = Q_down;
    assign led[4:3] = state;
    assign led[15:12] = debug;
    
    clock_divider #(2) clk_div_2(
                      .clk_d(clk_25MHz),
                      .clk(clk)
                  );

    clock_divider #(22) clk_div_22 (
                      .clk_d(clk_1Hz),
                      .clk(clk)
                  );

    Bot bot (
            .clk(clk),
            .reset(rst_op),
            .state(state),
            .Qstate(Qstate),
            .position(cactus_position),
            .cactus(cactus_type),
            .success_jump(success_jump),
            .prediction(prediction),
            .debug(debug)
        );
    ground gr(
               .h_cnt(h_cnt),
               .v_cnt(v_cnt),
               .clk(clk),
               .rst(rst_op),
               .state(state),
               .new_frame(new_frame),
               .black_ground(black_ground)
           );

    jump jp (
             .clk(clk),
             .jump_op(jump),
             .Q_jump(prediction),
             .rst(rst_op),
             .h_cnt(h_cnt),
             .v_cnt(v_cnt),
             .state(state),
             .new_frame(new_frame),
             .black_dino(black_dino),
             .success_jump(success_jump),
             .jumping(jumping)
         );
    cactus ct(
               .clk(clk),
               .rst(rst_op),
               .h_cnt(h_cnt),
               .v_cnt(v_cnt),
               .state(state),
               .new_frame(new_frame),
               .black_cactus(black_cactus),
               .cactus_position(cactus_position),
               .cactus_type(cactus_type)
           );
    score sc(
              .clk(clk),
              .rst(rst_op),
              .h_cnt(h_cnt),
              .v_cnt(v_cnt),
              .state(state),
              .black_score(black_score)
          );
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
    
    // game state transition
    always @(posedge clk) begin
        if (rst_op) begin
            last_state <= INITIAL;
            state <= INITIAL;
        end
        else begin
            last_state <= state;
            state <= next_state;
        end
    end
    
    always @(*) begin
        case (state)
            INITIAL: begin
                if (last_state == Q_LEARNING) begin
                    next_state = Q_LEARNING;
                end
                else begin
                    if (jump)
                        next_state = PLAY;
                    else if (Q_down)
                        next_state = Q_LEARNING;
                    else
                        next_state = INITIAL;
                end
            end
            PLAY: begin
                if(black_dino == 1'b1 && black_cactus == 1'b1)
                    next_state = DEAD;
                else
                    next_state = PLAY;
            end
            Q_LEARNING: begin
                if(black_dino == 1'b1 && black_cactus == 1'b1)
                    next_state = INITIAL;
                else begin
                    next_state = Q_LEARNING;
                end

            end
            DEAD: begin
                if (jump || last_state == Q_LEARNING)
                    next_state = INITIAL;
                else
                    next_state = DEAD;
            end
        endcase
    end
    
    // update Q state
    always @(posedge clk) begin
        if(rst_op)
            Qstate <= 2'b0;
        else if (new_frame) begin
            // the beginning of a new frame
            Qstate <= Qstate_between;
            Qstate_between <= 2'b0;
        end
        else begin
            // between frames
            Qstate <= 2'b0;
            Qstate_between <= Qstate_between | next_Qstate; // bitwise or
        end
    end
    always @(*) begin
        case (state)
            INITIAL: begin
                next_Qstate = 2'b0;
            end
            PLAY: begin
                next_Qstate = 2'b0;
            end
            Q_LEARNING: begin    
                // 640 - (posistion - 60 (cactus width)) < 80  (dino's left position)=> position > 620 => cactus over dino
                if(cactus_position >= 10'd620 && cactus_position < 10'd626)
                    // jumped successfully over a cactus
                    next_Qstate = 2'b1;
                else if(black_dino == 1'b1 && black_cactus == 1'b1) begin
                    if(jumping)
                        // jumped onto a cactus
                        next_Qstate = 2'b11;
                    else
                        // walked into a cactus
                        next_Qstate = 2'b10;
                end
                else
                    next_Qstate = 2'b0;
            end
            DEAD: begin
                next_Qstate = 2'b0;
            end
        endcase
    end

endmodule
