`timescale 1ns / 1ps
`define NUMofSECTOR 32 // number of  sector, ex: screen width = 640,  NUMofSECTOR = 32, 1 sector is 640/32=20 pixels wide
`define SECTORLENGTH 20 // 640/`NUMofSECTOR
`define NUMofCACTUS 3 // number of cactus type
module Bot(
        input clk, // clock signal
        input reset, // reset signal
        input [1:0] state, // game state
        input [1:0] Qstate, //  0: no update on Q table;
                            // 1: good reward update on Q table (for jumping);
                            // 2: bad reward on Q table for not jumping;
                            // 3: bad reward on Q table for jumping;
        input [9:0] position, // current distance to the closest cactus
        input [1:0] cactus, // current type of the closest cactus
        input success_jump, // when we jump successfully, this signal should raise to 1
        output reg prediction, // output the bot's prediction
        output wire [3:0] debug
    );

    integer i, j, k;

    reg [7:0] Q_table[`NUMofSECTOR-1:0][`NUMofCACTUS:0][1:0];
    reg [9:0] jump_distance; // record the distance to cactus when we jump successfully
    reg [1:0] jump_cactus; // record the type of cactus when we jump susccessfully
    reg [7:0] epsilon; // rate of exploration v.s. exploitation
    reg [30:0] counter; // we want to update epsilon every 20 seconds, that is log2(20*100M) = 31 bits
    wire [9:0] distance; // current distance to the cactus
    wire [7:0] rand_num1, rand_num2; // random number between 0 and 255
    
    assign distance = (10'd640-10'd121 >= position) ? 10'd640-10'd121-position : 10'd0 ; // screen width - dino position (mid) - cactus position (left)

    random random1 (.clk(clk), .rst(reset), .result(rand_num1));
    random random2 (.clk(clk), .rst(reset), .result(rand_num2));

    assign debug = epsilon[3:0];
    
    // always block for recording jump_distance and jump_cactus
    always @(posedge clk) begin
        if (reset) begin
            jump_distance <= 10'b0;
            jump_cactus <= 2'b0;
        end
        else if (success_jump) begin
            jump_distance <= distance;
            jump_cactus <= cactus;
        end
        else begin
            jump_distance <= jump_distance;
            jump_cactus <= jump_cactus;
        end
    end

    // make prediction
    always @(posedge clk) begin
        if (reset)
            prediction <= 1'b0;
        else begin
            if (epsilon > rand_num1)
                // explore
                prediction <= 1'b1;
            else begin
                // exploit
                if (distance > 10'd0)
                    // output 1'b1 (jump) if the q_value of current distance and cactus for jumping is greater than not jumping
                    prediction <= Q_table[distance/`SECTORLENGTH][cactus][1] > Q_table[distance/`SECTORLENGTH][cactus][0] ? 1'b1 : 1'b0;
                else
                    // do not jump when the cactus is behind dino
                    prediction <= 1'b0;
            end
        end
    end

    // updating the Q table
    // Q_value = 255: great! , 128: so so , 0: worst
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < `NUMofSECTOR; i = i + 1)
                for (j = 0; j <= `NUMofCACTUS; j = j + 1)
                    for (k = 0; k < 2; k = k + 1)
                        Q_table[i][j][k] <= 8'd128;
        end
        else begin
            // learning rate = 0.25 ( >> 2)
            case (Qstate)
                // no updates
                2'b00: begin
                end
                // good reward update on Q table (for jumping)
                2'b01: begin
                    Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1] <= Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1] + ((8'd255 - Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1]) >> 2);
                end
                // bad reward on Q table for not jumping;
                2'b10: begin
                    // (no updates)
                end
                // bad reward on Q table for jumping;
                2'b11: begin
                    Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1] <= Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1] - ((Q_table[jump_distance/`SECTORLENGTH][jump_cactus][1]) >> 2);
                end
            endcase
        end
    end
    
    // decrease epsilon every 20 seconds, until epsilon = 0
    always @(posedge clk) begin
        if (reset) begin
            counter <= 31'b0;
            // start at 10/256 ~= 4%
            epsilon <= 8'd10;
        end
        else if (state != 2'b10) begin
            // do not decrease if the game state is not Q learning
            counter <= counter;
            epsilon <= epsilon;
        end
        else begin
            if (counter >= 31'd2000000000) begin
                // over 20 seconds
                counter <= 31'b0;
                if (epsilon == 8'b0) begin
                    epsilon <= 8'b0;
                end
                else begin
                    // decrease 1/256 ~= 0.4%
                    epsilon <= epsilon - 8'b1;
                end
            end
            else begin
                counter <= counter + 31'b1;
                epsilon <= epsilon;
            end
        end
    end
endmodule
