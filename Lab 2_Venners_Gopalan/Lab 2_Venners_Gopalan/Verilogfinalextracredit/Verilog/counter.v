module counter(clock,reset,HEX4,HEX5,counter,bigcounter);
input clock,reset;
output wire [7:0] HEX4,HEX5;
output reg [3:0] counter, bigcounter;

always @(posedge clock or negedge reset)
begin
  if(reset == 0)
  counter <= 4'b0001;
  else if(counter == 4'b1001 && bigcounter == 4'b1001)
  counter <= 4'b0001;
  else if(counter == 4'b1001)
  counter <= 4'b0000;
  else
  counter <= counter + 1;
end

always @(posedge clock or negedge reset)
begin
  if(reset == 0) begin
  bigcounter <= 4'b1111;
  end
  else if (bigcounter == 4'b1001 && counter == 4'b1001) begin
  bigcounter <= 4'b1111;
  end
  else if (counter == 4'b1001 && bigcounter !== 4'b1111)
  bigcounter <= bigcounter + 1;
  else if (counter == 4'b1001)
  bigcounter <= 4'b0001;
end

print7seg U0 (.num(counter),.HEX(HEX4));
print7seg U1 (.num(bigcounter),.HEX(HEX5));

endmodule
