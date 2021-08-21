`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 08/20/2021 05:43:42 PM
// Module Name: Blink
// Description: Top module for blink game
//////////////////////////////////////////////////////////////////////////////////


module Blink(
    input clk,
    input reset,
    input [15:0] sw,
    input btn,
    output [15:0] led,
    output [7:0] seg,
    output [3:0] disp_en
    );
    
    logic t1, t3, t4, t5, t7, t8;
    logic [15:0] t2;
    logic [3:0] t6, t10;
    logic [6:0] t9;
    logic [7:0] t11;
    
    clk_div clk_div (.clk(clk), .score(t6), .sclk(t1) );
    led_FSM led_FSM ( .clk(t1), .reset(reset), .led(t2));
    blink_validity validity ( .led(t2), .switches(sw), .clk(clk), .Q(t3));
    loss_dec loss_dec ( .D(t3), .enable(btn), .clk(t1), .reset(reset), .Q(t4), .lose(t5));
    accumulator score ( .clk(t1), .D({3'b0, t4}), .CLR(reset), .LD(btn), .Q(t6) );
    game_FSM game_FSM (.x(t6), .lose(t5), .clk(t1), .reset(reset), .end_cond(t7), .win(t8));
    blink_sseg sseg (.BCD(t6), .seg(t9));
    bc_dec bc_dec (.Z(t8), .clk(clk), .DISP_EN(t10), .SEGMENTS(t11));
    MUX #(7) SEGMENT (.Zero({t9,1'b1}), .One(t11), .SEL(t7), .OUT(seg));
    MUX #(3) DISP_EN (.Zero(4'b0111), .One(t10), .SEL(t7), .OUT(disp_en));
    MUX #(15) LED (.Zero(t2), .One(16'b0000000000000000), .SEL(t7), .OUT(led));
    
endmodule
