`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jonathan Zoccola
// 
// Create Date: 08/20/2021 10:11:08 PM
// Module Name: clk_div
// Description: Clock divider for LED blinking speed
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div (
    input clk,
    input [3:0] score, 
    output logic sclk = 0
    );
    
    logic [29:0] count = 0;
    integer MAXCOUNT = (11 - score) * 3000000;
    always_ff @ (posedge clk)
    begin
        count = count + 2;
        if (count >= MAXCOUNT)
        begin
            count = 0;
            sclk = ~ sclk;
        end
    end
endmodule
