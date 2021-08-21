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
    input clk, LD, CLR,
    input [3:0] D,
    output logic [3:0] Q = 0
    );
   
    always_ff @ (posedge clk)
    begin
        if (CLR)
            Q <= 0;
        else if (LD)
            Q <= D + Q;
         
   
    end
endmodule
