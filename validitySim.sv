`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2021 01:10:18 PM
// Design Name: 
// Module Name: validitySim
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


module validitySim(

    );
    
    logic clk, btn;
    logic [15:0] led, switches;
    
    blink_validity blink_validity_inst (.*);
    
   //list your test cases

        initial

            begin
            //False Test Case: Q output 0
            clk = 0; btn = 0; led = 16'b0000000000000001; switches = 16'b0000000000000000;
            #10

           
            //True Test Case: Q Output 1
            clk = 1; btn = 1; led = 16'b0000000000001000; switches = 16'b0000000000011100;

            end   

endmodule
