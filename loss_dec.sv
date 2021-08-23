`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Jonathan Zoccola
// 
// Create Date: 08/20/2021 05:32:27 PM
// Design Name: 
// Module Name: loss_dec
// Description: This module detects a loss and sends an input to the game FSM
// 
//////////////////////////////////////////////////////////////////////////////////


module loss_dec(
    input D,
    input enable,
    input clk,
    input reset,
    output logic Q,
    output logic lose = 0
    );
    
    always_ff @ (posedge clk, posedge reset, posedge enable, negedge enable)
     begin
        if (reset) begin
            Q <= 0;
            lose <= 0;
        end
        else if (enable) begin
            if (D <= 0) begin
                Q <= 0;
                lose <= 1;
            end
         else if (enable) begin
            if (D <= 1) begin
            Q <= 1;
            lose <= 0;
            end
            
            else begin
                Q <= D;
                lose <= 0;
            end
        end
    end
    end
endmodule
