`timescale 1ns / 1ps
`define NUMofSECTOR 32 // number of  sector, ex: screen width = 640,  NUMofSECTOR = 32, 1 sector is 640/32=20 pixels wide
`define NUMofCACTUS 4 // number of cactus type
module Bot(
        input clk, // clock signal
        input reset, // reset signal
        input [1:0] state,
        //  0: no update on Q table;
        // 1: good reward update on Q table (for jumping);
        // 2: bad reward on Q table for not jumping;
        // 3: bad reward on Q table for jumping;
        input [9:0] distance, // current distance to the closest cactus
        input [2:0] cactus, // current type of the closest cactus
        input [9:0] jump_distance, //  which distance in the Q table should I update?
        input [2:0] jump_cactus, // which type of cactus in the Q table should I update?
        output reg prediction
    );

    reg [7:0] Q_table[`NUMofSECTOR-1:0][`NUMofCACTUS-1:0][1:0];
    integer i, j, k;

    reg [7:0] epsilon; // rate of exploration v.s. exploitation
    wire [7:0] rand_num1, rand_num2; // random number between 0 and 255

    reg [33:0] counter; // we want to update epsilon every 20 seconds, that is log2(20*500M) = 34 bits

    random random1 (.clk(clk), .rst(reset), .result(rand_num1));
    random random2 (.clk(clk), .rst(reset), .result(rand_num2));

    // make prediction
    always @(posedge clk) begin
        if (reset) begin
            prediction <= 1'b0;
        end
        else begin
            if (epsilon > rand_num1) begin
                // explore
                if (rand_num2 > 8'd127) begin
                    prediction <= 1'b1;
                end
                else begin
                    prediction <= 1'b0;
                end
            end
            else begin
                // exploit
                // output 1'b1 (jump) if the q_value of current distance and cactus of jumping is greater than not jumping
                prediction <= Q_table[distance/`NUMofSECTOR][cactus][1] > Q_table[distance/`NUMofSECTOR][cactus][1] ? 1'b1 : 1'b0;
            end
        end
    end

    // updating the Q table
    // Q_value = 255: great!, 128: so so, 0: worst
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < `NUMofSECTOR; i = i + 1) begin
                for (j = 0; j < `NUMofCACTUS; j = j + 1) begin
                    for (k = 0; k < 2; k = k + 1) begin
                        Q_table[i][j][k] <= 8'd128;
                    end
                end
            end
        end
        else begin
            case (state)
                // no updates
                2'b00: begin
                end
                // good reward update on Q table (for jumping)
                2'b01: begin
                    Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1] <= Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1] + ((8'd255 - Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1]) >> 2);
                end
                2'b10: begin
                    Q_table[jump_distance/`NUMofSECTOR][jump_cactus][0] <= Q_table[jump_distance/`NUMofSECTOR][jump_cactus][0] - ((Q_table[jump_distance/`NUMofSECTOR][jump_cactus][0]) >> 2);
                end
                2'b11: begin
                    Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1] <= Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1] - ((Q_table[jump_distance/`NUMofSECTOR][jump_cactus][1]) >> 2);
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            counter <= 34'b0;
            epsilon <= 8'd16;
        end
        else begin
            if (counter >= 34'd10000000000) begin
                counter <= 34'b0;
                if (epsilon == 8'b0) begin
                    epsilon <= 8'b0;
                end
                else begin
                    epsilon <= epsilon - 8'b1;
                end
            end
            else begin
                counter <= counter + 34'b1;
                epsilon <= epsilon;
            end
        end

    end

endmodule
