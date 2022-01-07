module clock_divider #(parameter n = 2)(clk_d, clk);
    input clk;
    output clk_d;
    reg [n-1:0]count;
    wire[n-1:0]next_count;

    always@(posedge clk) begin
        count <= next_count;
    end

    assign next_count = count + 1;
    assign clk_d = count[n-1];
endmodule
