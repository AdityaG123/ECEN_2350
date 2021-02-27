module print7seg( num , HEX);
input [3:0]num;
output reg [7:0]HEX;
always @(num)
begin
  case (num) 
  4'b0000: HEX = ~8'b0011_1111; // 0
  4'b0001: HEX = ~8'b0000_0110; //1
  4'b0010: HEX = ~8'b0101_1011;  //2
  4'b0011: HEX = ~8'b0100_1111;  //3
  4'b0100: HEX = ~8'b0110_0110;  //4
  4'b0101: HEX = ~8'b0110_1101;  //5 
  4'b0110: HEX = ~8'b0111_1101;  //6
  4'b0111: HEX = ~8'b0000_0111;  //7
  4'b1000: HEX = ~8'b0111_1111;  //8 
  4'b1001: HEX = ~8'b0110_0111;  //9
  4'b1010: HEX = ~8'b0111_0001;  //F
  4'b1011: HEX = ~8'b0100_0000; // negative
  default: HEX = ~8'b0000_0000;  //reset
  endcase
end

endmodule