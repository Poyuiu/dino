module pixel_gen(
        input [9:0] h_cnt,
        input [9:0] v_cnt,
        input black_ground,
        input black_dino,
        input valid,
        output reg [3:0] vgaRed,
        output reg [3:0] vgaGreen,
        output reg [3:0] vgaBlue
    );
    always @(*) begin
        if(!valid)
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else
            {vgaRed, vgaGreen, vgaBlue} = ((black_ground == 1) || (black_dino == 1))
            ? 12'h000 : 12'hfff;
    end
endmodule
