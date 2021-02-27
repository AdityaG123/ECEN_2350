module toplab3_man_test(ADC_CLK_10,KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input ADC_CLK_10;
input [1:0] KEY;
input [1:0] SW;
output wire [9:0] LEDR;
output wire [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;

wire jank1;
wire clock;
wire [3:0] mode;
wire [9:0] state,current;

create_clock2 #(10'b111110100) U0 (.reset(KEY[0]),.clock_in(ADC_CLK_10),.LED(jank1),.clock_out(clock));

Mode U1 (.SW(SW[1:0]),.KEY(KEY[1:0]),.MODE(mode));

print7seg U2 (.num(mode),.HEX(HEX0));

NextState U3 (.mode(mode),.current(current),.next(state));

CSL U4 (.clock(clock),.reset(KEY[0]),.next(state),.current(current));

assign LEDR[9:0] = current[9:0];
//assign LEDR[9] = jank1;

print7seg U9 (.num(4'b1111),.HEX(HEX1));
print7seg U5 (.num(4'b1111),.HEX(HEX2));
print7seg U6 (.num(4'b1111),.HEX(HEX3));
print7seg U7 (.num(4'b1111),.HEX(HEX4));
print7seg U8 (.num(4'b1111),.HEX(HEX5));

endmodule