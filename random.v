`timescale 1ns / 1ps
// design reference:  https://en.wikipedia.org/wiki/Linear-feedback_shift_register
module random(clk, rst, result); // (pseudo random)
    input clk;
    input rst;
    output wire [7:0] result;
    
    reg [31:0] num;
    wire in;    
    assign result = {num[18], num[16], num[12], num[10], num[6], num[4], num[2], num[1]};
    assign in = (num[31]^num[21])^(num[1]^num[0]);

    always @(posedge clk) begin
        if (rst) begin
            num <= 32'b10111000110101101011011010111100;
        end
        else begin
            num <= {num[30:0], in};
        end
    end
endmodule
