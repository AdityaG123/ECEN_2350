module create_clock(clock_in,LED,clock_out);
input clock_in;
output reg clock_out,LED;

parameter [31:0] divide_by = 0;
reg [31:0] divide_counter;

always @(posedge clock_in)
begin 
if(divide_by == divide_counter) 
begin
divide_counter <= 0;
clock_out <= ~clock_out;
LED <= ~LED;
end
else
divide_counter <= divide_counter + 1;
end



endmodule
