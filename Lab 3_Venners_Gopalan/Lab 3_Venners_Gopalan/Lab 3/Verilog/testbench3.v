`timescale 1ns/100ps

module testbench3();
reg my_ADC_CLK_10;
reg [1:0] my_KEY;
reg [1:0] my_SW;
wire [9:0] my_LEDR;
wire [7:0] my_HEX0, my_HEX1, my_HEX2, my_HEX3, my_HEX4, my_HEX5;

always
#100 my_ADC_CLK_10 = ~my_ADC_CLK_10;
 

toplab3_man_test U0 (.ADC_CLK_10(my_ADC_CLK_10),.KEY(my_KEY),.SW(my_SW),.LEDR(my_LEDR),.HEX0(my_HEX0),.HEX1(my_HEX1),.HEX2(my_HEX2),.HEX3(my_HEX3),.HEX4(my_HEX4),.HEX5(my_HEX5));


initial
begin
$dumpfile("out.vcd");
$dumpvars;
$display($time, " << Starting Simulation >>");
my_ADC_CLK_10 = 0;
my_KEY[0] = 1;
my_KEY[1] = 0;
my_SW[0] = 1;
my_SW[1] = 0;
#100000 my_SW[0] = 1;

#100000 my_KEY[0] = 0;
#100000 my_KEY[0] = 0;
#100000 my_KEY[0] = 0;
#100000
#100000

#100000 my_KEY[0] = 1;
#100000 my_KEY[0] = 1;
#100000 my_KEY[0] = 1;
#100000 my_KEY[0] = 1;
#100000 my_KEY[0] = 1;
#100000 my_KEY[0] = 1;
#100000
#100000


#100000 my_SW[1] = 1; my_SW[0] = 0;
#100000 my_SW[1] = 1;
#100000 my_SW[1] = 1;
#100000 my_SW[1] = 1;
#100000 my_SW[1] = 1;
#100000 my_SW[1] = 1;
#100000 my_SW[1] = 1;
#100000
#100000

#100000 my_KEY[1] = 1;
#100000 my_KEY[1] = 1;
#100000 my_KEY[1] = 1;
#100000 my_KEY[1] = 1;
#100000 my_KEY[1] = 1;
#100000
#100000
#100000

$finish;
end

initial
begin
 $monitor($time," my_KEY: %b, SW1: %b, SW0: %b, my_HEX0: %b, LEDR9: %b, LEDR8: %b, LEDR7: %b, LEDR2: %b, LEDR1: %b, LEDR0: %b", my_KEY[1:0], my_SW[1], my_SW[0], my_HEX0, my_LEDR[9], my_LEDR[8], my_LEDR[7], my_LEDR[2], my_LEDR[1], my_LEDR[0]);
end

endmodule