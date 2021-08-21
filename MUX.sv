`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Asa Grote
// 
// Create Date: 07/16/2021 11:58:14 AM
// Module Name: MUX
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX #(parameter WIDTH = 1)(
    input SEL,
    input [WIDTH:0] Zero,
    input [WIDTH:0] One,
    output reg [WIDTH:0] OUT
    );
    always_comb
    begin
        if (SEL == 1'b1)
            begin
                OUT = One;
            end
        else 
            begin
                OUT = Zero;
            end
    end
endmodule
