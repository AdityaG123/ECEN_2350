module toplab3(ADC_CLK_10,KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input ADC_CLK_10;
input [1:0] KEY;
input [9:0] SW;
output wire [9:0] LEDR;
output wire [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;

wire clock, jank1;
reg [1:0] counter;
wire [2:0] mem_inputs;

reg [1:0] finalKEY,finalSW;

create_clock2 #(25'b1_0111_1101_0111_1000_0100_0000) U0 (.reset(KEY[0]),.clock_in(ADC_CLK_10),.LED(jank1),.clock_out(clock)); // 1/5 hertz clock

always @(posedge clock or negedge KEY[0])
begin
if(KEY[0] == 0)
counter <= 2'b00;
else if(counter == 2'b11)
counter = 2'b00;
else
counter = counter + 1;
end

mem U1 (.address(counter),.clock(clock),.q(mem_inputs));

always @(SW[9])
begin
  if (SW[9] == 0) begin
  finalSW = SW[1:0];
  finalKEY = KEY;
  end
  else if (SW[9] == 1) begin
  finalSW = mem_inputs[2:1];
  finalKEY[1] = mem_inputs[0];
  finalKEY[0] = KEY[0];
  end
end

toplab3_man U3 (.ADC_CLK_10(ADC_CLK_10),.KEY(finalKEY),.SW(finalSW),.LEDR(LEDR),.HEX0(HEX0),.HEX1(HEX1),.HEX2(HEX2),.HEX3(HEX3),.HEX4(HEX4),.HEX5(HEX5));





endmodule