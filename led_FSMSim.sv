`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jonathan Zoccola
// 
// Create Date: 08/21/2021 08:09:44 PM
// Design Name: 
// Module Name: led_FSMSim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This simulation tests the inputs of the led_FSM design module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_FSMSim(

    );
    logic clk;
    logic reset;
    logic [15:0] led;
    
    led_FSM led_FSM_inst (.*);
    
    //Test Cases: //How should I calculate the clock at each posedge?
    initial
        begin
        clk = 0;
        reset = 0;
        #10
        
        clk = 1;
        reset = 0;
        #10
        
        clk = 2;
        reset = 0;
        #10
        
        clk = 3;
        reset = 0;
        #10
        
        clk = 4;
        reset = 0;
        #10
        
        clk = 1'b1;
        reset = 0;
        #10
        
        clk = 5;
        reset = 0;
        #10
        
        clk = 6;
        reset = 0;
        #10
        
        clk = 7;
        reset = 0;
        #10

        clk = 8;
        reset = 0;
        #10
        
        clk = 9;
        reset = 0;
        #10
        
        clk = 10;
        reset = 0;
        #10
        
        clk = 11;
        reset = 0;
        #10
        
        clk = 12;
        reset = 1;
        end
        
endmodule
