module Mode(SW,KEY,MODE); //determines the state of the lights, whether in turn(left or right), hazards, or off
input [1:0]SW,KEY;
output reg [3:0] MODE;
parameter hazard = 4'b0001, left = 4'b0010, right = 4'b0011, off = 4'b0000;
//reg [3:0] comb = {SW[1:0],KEY[1:0]};

// always @(SW or KEY)
// begin
//   if (KEY[0] == 0)
//   MODE = off;
//   else if (SW[0] == 1) begin
//   MODE = hazard;
//   end
//   else if (SW[1] == 1 && KEY[1] == 0) begin
//   MODE = left;
//   end
//   else if (SW[1] == 1 && KEY[1] == 1) begin
//   MODE = right;
//   end
//   else begin 
//   MODE = off;
//   end
// end

always @(SW or KEY) 
begin
case ({SW[1],SW[0],KEY[1],KEY[0]})
4'b0000: MODE = off;
4'b1101: MODE = hazard; //xs dont seem to be working, hard code to options
4'b0101: MODE = hazard;
4'b1111: MODE = hazard;
4'b0111: MODE = hazard;
4'b1001: MODE = left;
4'b1011: MODE = right;
default: MODE = off;
endcase
end

endmodule
