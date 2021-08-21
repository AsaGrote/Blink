`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 08/20/2021 11:02:35 AM
// Design Name: 
// Module Name: led_FSM 
// Description: FSM with 16 states: one for each LED on the basys 3 board
//              on, while the rest stay off. The FSM goes through each 
//              state, at a constant speed 
// 
//////////////////////////////////////////////////////////////////////////////////


module led_FSM(
    input clk,
    input reset,
    output logic [15:0] led
    );
   
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
    logic [4:0] NS;
    logic [4:0] PS = START;
   
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [4:0] START = 4'b0000, ST1 = 4'b0001, ST2= 4'b0010, ST3 = 4'b0011, ST4 = 4'b0100, ST5 = 4'b0101, ST6 = 4'b0110, ST7 = 4'b0111, ST8 = 4'b1000, ST9 = 4'b1001, ST10 = 4'b1010, ST11 = 4'b1011, ST12 = 4'b1100, ST13 = 4'b1101, ST14 = 4'b1110, ST15 = 4'b1111;
   
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
        if (reset) PS = START;
        else PS = NS;
    end
   
    //combinatorial logic
    always_comb
    begin
    //initialze all outputs to zero
    led <= 16'b0000000000000001;
    case (PS)
        START:
        begin
            led <= 16'b0000000000000001; //moore outputs depend only on state
            begin
                NS = ST1;
            end
         end
         
         ST1:
         begin
            led <= 16'b0000000000000010;
            begin
                NS = ST2;
            end
         end
         
         ST2:
         begin
            led <= 16'b0000000000000100;
            begin
                NS = ST3;
            end
         end
         
         ST3:
         begin
            led <= 16'b0000000000001000;
            begin
                NS = ST4;
            end
         end
         
         ST4:
         begin
            led <= 16'b0000000000010000;
            begin
                NS = ST5;
            end
         end
         
         ST5:
         begin
            led <= 16'b0000000000100000;
            begin
                NS = ST6;
            end
         end
         
         ST6:
         begin
            led <= 16'b0000000001000000;
            begin
                NS = ST7;
            end
         end

         ST7:
         begin
            led <= 16'b0000000010000000;
            begin
                NS = ST8;
            end
         end

         ST8:
         begin
            led <= 16'b0000000100000000;
            begin
                NS = ST9;
            end
         end

         ST9:
         begin
            led <= 16'b0000001000000000;
            begin
                NS = ST10;
            end
         end

         ST10:
         begin
            led <= 16'b0000010000000000;
            begin
                NS = ST11;
            end
         end

         ST11:
         begin
            led <= 16'b0000100000000000;
            begin
                NS = ST12;
            end
         end

         ST12:
         begin
            led <= 16'b0001000000000000;
            begin
                NS = ST13;
            end
         end

         ST13:
         begin
            led <= 16'b0010000000000000;
            begin
                NS = ST14;
            end
         end

         ST14:
         begin
            led <= 16'b0100000000000000;
            begin
                NS = ST15;
            end
         end

         ST15:
         begin
            led <= 16'b1000000000000000;
            begin
                NS = START;
            end
         end
         
         default:
            NS = START;
      endcase      
      end      
endmodule

