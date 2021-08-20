module level_FSM(
    input clk,
    input reset,
    input x,
    output logic level
    );
    
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
    logic [2:0] NS;
    logic [2:0] PS = START;
    
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [2:0] START = 3'b000, ST1 = 3'b001, ST2= 3'b010, ST3 = 3'b011, WIN = 3'b100;
    
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
    level = 3'b001;
    case (PS)
        START:
        begin
            level = 3'b001; //moore outputs depend only on state
            if (x == 1)
            begin
                NS = ST1;
            end
            else
            begin
                NS = START;
            end
         end
         
         ST1:
         begin
            level = 3'b010;
            if (x == 1)
            begin
                NS = ST2;
            end
            else
            begin
                NS = START;
            end
         end
         
         ST2:
         begin
            level = 3'b011;
            if (x == 1)
            begin
                NS = ST3;
            end
            else
            begin
                NS = START;
            end
         end
         
         ST3: 
         begin
            level = 3'b100;
            if (x == 1)
            begin
                NS = WIN
            end
            else
            begin
                NS = START;
            end
         end
         
         default:
            NS = START;
      endcase      
      end       
endmodule