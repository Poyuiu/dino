`timescale 1ns / 1ps
// design reference:  https://en.wikipedia.org/wiki/Linear-feedback_shift_register
module random(clk, rst, result); // (pseudo random)
    input clk;
    input rst;
    output reg [7:0] result;

    wire in;
    assign in = (result[7]^result[5])^(result[4]^result[3]);

    always @(posedge clk) begin
        if (rst) begin
            result <= 8'b10111000;
        end
        else begin
            result <= {result[6:0], in};
        end
    end
endmodule
