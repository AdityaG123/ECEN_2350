module integrated(SW,KEY,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input [9:0]SW;
input [1:0] KEY;
output reg [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output reg [9:0] LEDR;
wire [9:0] my_LEDR;
wire [7:0] my_HEX0,my_HEX1,my_HEX2,my_HEX3,my_HEX4,my_HEX5;
wire [9:0] his_LEDR;
wire [7:0] his_HEX0,his_HEX1,his_HEX2,his_HEX3,his_HEX4,his_HEX5;
wire [9:0] her_LEDR;
wire [7:0] her_HEX0,her_HEX1,her_HEX2,her_HEX3,her_HEX4,her_HEX5;

designblock1 U0 (.SW(SW) , .KEY(KEY) , .LEDR(my_LEDR), .HEX0(my_HEX0), .HEX1(my_HEX1), .HEX2(my_HEX2), .HEX3(my_HEX3), .HEX4(my_HEX4), .HEX5(my_HEX5));
designblock2 U1 (.SW(SW) , .KEY(KEY) , .LEDR(his_LEDR), .HEX0(his_HEX0), .HEX1(his_HEX1), .HEX2(his_HEX2), .HEX3(his_HEX3), .HEX4(his_HEX4), .HEX5(his_HEX5));
designblock3 U2 (.KEY(KEY), .SW(SW) , .LEDR(her_LEDR), .HEX0(her_HEX0), .HEX1(her_HEX1), .HEX2(her_HEX2), .HEX3(her_HEX3), .HEX4(her_HEX4), .HEX5(her_HEX5));


always @(SW[9:8])
begin
  if (SW[9:8]==2'b00) begin
  LEDR[9:8] = 2'b00;
  LEDR[7:0] = my_LEDR[7:0];
  HEX0[7:0] = my_HEX0[7:0];
  HEX1[7:0] = my_HEX1[7:0];
  HEX2[7:0] = my_HEX2[7:0];
  HEX3[7:0] = my_HEX3[7:0];
  HEX4[7:0] = my_HEX4[7:0];
  HEX5[7:0] = my_HEX5[7:0];
end
else if (SW[9:8]==2'b01)begin
  LEDR[9:8] = 2'b01;
  LEDR[7:0] = his_LEDR[7:0];
  HEX0[7:0] = his_HEX0[7:0];
  HEX1[7:0] = his_HEX1[7:0];
  HEX2[7:0] = his_HEX2[7:0];
  HEX3[7:0] = his_HEX3[7:0];
  HEX4[7:0] = his_HEX4[7:0];
  HEX5[7:0] = his_HEX5[7:0];
end
else begin
  LEDR[9:0] = her_LEDR[9:0];
  HEX0[7:0] = her_HEX0[7:0];
  HEX1[7:0] = her_HEX1[7:0];
  HEX2[7:0] = her_HEX2[7:0];
  HEX3[7:0] = her_HEX3[7:0];
  HEX4[7:0] = her_HEX4[7:0];
  HEX5[7:0] = her_HEX5[7:0];
end
end
endmodule