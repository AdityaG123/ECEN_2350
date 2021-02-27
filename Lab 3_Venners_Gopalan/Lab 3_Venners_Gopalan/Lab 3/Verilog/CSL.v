module CSL(clock,reset,next,current);
input clock,reset;
input [9:0] next;
output reg [9:0] current;

always @(posedge clock or negedge reset)
begin
  if(reset == 0)
  current = 10'b0000000000;
  else
  current = next;
end

endmodule