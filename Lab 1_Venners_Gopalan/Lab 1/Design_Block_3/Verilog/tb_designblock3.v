`timescale 1ns/100ps
module tb_designblock3();
reg [9:0] my_SW;
wire [9:0] my_LEDR;
wire [1:0] my_KEY;
wire [7:0] my_HEX0,my_HEX1,my_HEX2,my_HEX3,my_HEX4,my_HEX5;

designblock3 U0 (.KEY(my_KEY),.SW(my_SW),.LEDR(my_LEDR),.HEX0(my_HEX0),.HEX1(my_HEX1),.HEX2(my_HEX2),.HEX3(my_HEX3),.HEX4(my_HEX4),.HEX5(my_HEX5));

initial 
begin
  $dumpfile("output.vcd");
  $dumpvars;
  $display("begin");
  #30 my_SW[9:0] = 10'b1101111000; //signed 7 vs -8;
  $display("LEDR should be 010");
  #30 my_SW[9:0] = 10'b1000000000;
  $display("LEDR should be 100");
  #30 my_SW[9:0] = 10'b1000010111;
  $display("LEDR should be 001");
  #30 my_SW[9:0] = 10'b1110000000;
  $display("LEDR should be 001");
  $finish;
end

initial    
begin    
  $monitor($time, "my_SW = %b, my_LEDR = %b ",my_SW[9:0],my_LEDR[2:0]);    
  end
endmodule