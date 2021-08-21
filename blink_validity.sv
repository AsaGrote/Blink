`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 08/20/2021 12:14:47 PM
// Design Name: 
// Module Name: blink_validity
// Description: This module checks if an LED and switch are both on at the same time
//
//////////////////////////////////////////////////////////////////////////////////


module blink_validity(
    input clk,
    input [15:0] led,
    input [15:0] switches,
    output reg Q
    );
    
    integer i;
    always_ff @ (posedge clk) begin
        Q <= 0;
        for (i=0; i <= 15; i=i+1) begin
            if (led[i] == 1 && switches[i] == 1) begin
                Q <= 1;
            end
        end
    end
endmodule
