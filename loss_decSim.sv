`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jonathan Zoccola
// 
// Create Date: 08/23/2021 11:27:05 AM
// Design Name: 
// Module Name: loss_decSim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module loss_decSim(

    );
    
    logic D;
    logic enable;
    logic clk;
    logic reset;
    logic  Q;
    logic lose = 0;
    
    loss_dec loss_dec_inst (.*);
     //Clk Code
    always
    begin
    clk = 1;
    #5;
    
    clk = 0;
    #5;
    end
    
    //test cases:
    initial
        begin
        
        //Playing in a win state:
        D = 1;
        enable = 0;
        reset = 0;
        #10
        
        //Playing in a lose state
        D = 0;
        enable = 0;
        reset = 0;
        #10
        
        //Win:
        D = 1;
        enable = 1;
        reset = 0;
        #10
        
        //Reset
        D = 0;
        enable = 0;
        reset = 1;
        #10
        
        //Lose:
        D = 0;
        enable = 1;
        reset = 0;
        #10
        
        //Reset overtaking enable
        D = 1;
        enable = 1;
        reset = 1;
        end
        
endmodule
