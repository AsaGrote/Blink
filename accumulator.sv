`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 08/20/2021 05:08:02 PM
// Design Name: 
// Module Name: accumulator
// Description: This module counts up the score of the player
// 
//////////////////////////////////////////////////////////////////////////////////


module accumulator(
    input clk, CLR, LD,
    input [3:0] D,
    output logic [3:0] Q = 0
    );
   
    always_ff @ (posedge clk, posedge CLR)
    begin
        if (CLR) begin
            Q <= 0;
            end
        else if (LD)
         begin
            Q <= D + Q;
         end
         
   
    end
endmodule
