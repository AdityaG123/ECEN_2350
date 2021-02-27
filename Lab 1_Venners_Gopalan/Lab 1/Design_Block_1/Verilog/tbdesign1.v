`timescale 1ns/100ps
module tbdesign1();
reg [7:0] my_SW;
reg [1:0] my_KEYS;
wire [7:0] my_LEDS;
wire [7:0] my_HEX0, my_HEX1, my_HEX2, my_HEX3, my_HEX4, my_HEX5;

designblock1 U0 (.SW(my_SW),.KEY(my_KEYS),.LEDR(my_LEDS),.HEX0(my_HEX0),.HEX1(my_HEX1),.HEX2(my_HEX2),.HEX3(my_HEX3),.HEX4(my_HEX4),.HEX5(my_HEX5));    

initial
begin
  $dumpfile("out.vcd");
  $dumpvars;
  #10 my_KEYS[0] = 0;
  $display("First birthday number= 11000000");
  #10 my_KEYS[0] = 1;
  $display("Second birthday number= 11111001");
  #10 my_SW[7:0] = 8'b10001111; my_KEYS[1] = 1;
  $display("LED states should be = 01110000");
  #10 my_KEYS[1] = 0;
  $display("LED states should be = 10001111");
end

initial    
begin  
  $monitor($time, "my_HEX5 = %b, my_SW = %b,my_LEDS = %b ",my_HEX5[7:0],my_SW[7:0],my_LEDS[7:0]);    
  end
endmodule
