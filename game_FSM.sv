`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 08/20/2021 05:10:56 PM
// Module Name: game_FSM
// Description: This module controls the state of the game, 3 states: 
//              PLAY
//              LOSE or
//              WIN
// 
//////////////////////////////////////////////////////////////////////////////////

module game_FSM(
    input clk,
    input reset,
    input lose,
    input [3:0] x,
    output logic end_cond = 0,
    output logic win = 0
    );
    
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
    logic [2:0] NS;
    logic [2:0] PS = PLAY;
    
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [2:0] PLAY = 2'b00, LOSE = 2'b01, WIN = 2'b10;
    
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
        if (reset) PS = PLAY;
        else PS = NS;
    end
    
    //combinatorial logic 
    always_comb 
    begin
    //initialze all outputs to zero
    end_cond = 0;
    win = 0;
    case (PS)
        PLAY:
        begin
            end_cond = 0; //moore outputs depend only on state
            win = 0;
            if (x > 4'b1001)
            begin
                NS = WIN;
            end
            else if (lose)
            begin
                NS = LOSE;
            end
            else 
            begin
                NS = PLAY;
            end
         end
         
         LOSE:
         begin
            end_cond = 1;
            win = 0;
            if (reset)
            begin
                NS = PLAY;
            end
            else
            begin
                NS = LOSE;
            end
         end
         
         WIN:
         begin
            end_cond = 1;
            win = 1;
            if (reset)
            begin
                NS = PLAY;
            end
            else
            begin
                NS = WIN;
            end
         end
         
         default:
            NS = PLAY;
      endcase      
      end       
endmodule
