module level_register #(parameter WIDTH = 1) (
    input [WIDTH:0] D,
    input clk,
    input enable,
    output logic [WIDTH:0] Q = 0
);

    always_ff @ (posedge clk) begin
        if (enable)
            Q = D;
    end
endmodule