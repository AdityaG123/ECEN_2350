module NextState(mode,current,next);
input [3:0] mode;
input [9:0] current;
output reg [9:0] next;
parameter hazard = 4'b0001, left = 4'b0010, right = 4'b0011, off = 4'b0000;
parameter left1 = 10'b0010000000, left2 = 10'b0110000000, left3 = 10'b1110000000, left4 = 10'b0000000000;
parameter right1 = 10'b0000000100, right2 = 10'b0000000110, right3 = 10'b0000000111, right4 = 10'b0000000000;
parameter hazard1 = 10'b1110000111, hazard2 = 10'b0000000000;

always @(mode or current)
begin
  if(mode == hazard) begin
    if(current !== hazard1) next <= hazard1;
    if(current == hazard1) next <= hazard2;
  end
  else if(mode == left) begin
    case (current)
    left1: next <= left2;
    left2: next <= left3;
    left3: next <= left4;
    left4: next <= left1;
    default: next <= left1;
    endcase
  end
  else if(mode == right) begin
    case (current)
    right1: next <= right2;
    right2: next <= right3;
    right3: next <= right4;
    right4: next <= right1;
    default: next <= right1;
    endcase
  end  
  else if(mode == off) begin
    next <= 10'b0000000000;
  end
  else begin
    next <= 10'b0000000000;
  end
end

endmodule