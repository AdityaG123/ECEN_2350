module toplab2(ADC_CLK_10,KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input ADC_CLK_10;
input [1:0] KEY;
output wire [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output wire [9:0] LEDR, SW;

wire [3:0] counter, bigcounter;
wire slowclock,slowclockfive,slowclockfinal,fastLED,slowLED;
reg changeclock,reset;

create_clock #(23'b100_1100_0100_1011_0100_0000) U0 (.clock_in(ADC_CLK_10),.LED(fastLED),.clock_out(slowclock)); //real 1hz
create_clock #(20'b111_1010_0001_0010_00000) U3 (.clock_in(ADC_CLK_10),.LED(slowLED),.clock_out(slowclockfive)); //test 10hz


always @(negedge KEY[1])
begin
  changeclock <= ~changeclock;
end

always @(negedge KEY[0])
begin
  reset <= ~reset;
end


assign slowclockfinal = changeclock ? slowclockfive : slowclock;
assign LEDR[1] = changeclock ? slowLED : fastLED;
assign LEDR[0] = reset ? 0:1;

counter U1 (.clock(slowclockfinal),.reset(reset),.HEX4(HEX4),.HEX5(HEX5),.counter(counter),.bigcounter(bigcounter));

date U2 (.clock(slowclockfinal),.reset(reset),.counter(counter),.bigcounter(bigcounter),.HEX0(HEX0),.HEX1(HEX1),.HEX2(HEX2),.HEX3(HEX3));

endmodule

