module designblock3(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input [1:0] KEY;
input [9:0] SW;
output reg [9:0] LEDR;
output wire [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;

wire [3:0] x, y;
wire [3:0] negative1,negative2,printsign1,printsign2,num1,num2,printnum1,printnum2,final1,final2;
wire signednum;

assign x[3:0] = SW[7:4];
assign y[3:0] = SW[3:0];

assign signednum = SW[8] ? 1:0; //if num are signed signednum=1
assign negative1 = x[3] ? 4'b1011:4'b1010;
assign negative2 = y[3] ? 4'b1011:4'b1010;
assign printsign1 = signednum ? negative1[3:0]:4'b1010;
assign printsign2 = signednum ? negative2[3:0]:4'b1010;


print7seg3 U0 (.num(printsign1), .HEX(HEX5));
print7seg3 U1 (.num(printsign2), .HEX(HEX1));

assign num1 = signednum ? negative1:4'b1010;
assign printnum1 = num1[0] ? ~x[3:0]+1:x[3:0];
assign num2 = signednum ? negative2:4'b1010;
assign printnum2 = num2[0] ? ~y[3:0]+1:y[3:0];
assign final1 = (printnum1[3:0]>4'b1000) ? 4'b1111:printnum1[3:0];
assign final2 = (printnum2[3:0]>4'b1000) ? 4'b1111:printnum2[3:0];

print7seg3 U2 (.num(final1), .HEX(HEX4));
print7seg3 U3 (.num(final2), .HEX(HEX0));
print7seg3 U4 (.num(4'b1010), .HEX(HEX3));
print7seg3 U5 (.num(4'b1010), .HEX(HEX2));

always @(x[3:0] || y[3:0] || signednum)
begin
if (signednum) begin
    if(negative1[0] && ~negative2[0]) begin
LEDR[0] = 1;
LEDR[2:1] = 0;
end
    else if(~negative1[0] && negative2[0])begin
LEDR[1] = 1;
LEDR[0] = 0;
LEDR[2] = 0;
end 
    else if(negative1[0] && negative2[0])begin
LEDR[2] = (printnum1==printnum2) ? 1:0; //compares absolute value of numbers. how to add negative?
LEDR[1] = (printnum1<printnum2) ? 1:0;
LEDR[0] = (printnum1>printnum2) ? 1:0;
end
    else begin
 LEDR[2] = (printnum1==printnum2) ? 1:0; //compares absolute value of numbers. how to add negative?
LEDR[1] = (printnum1>printnum2) ? 1:0;
LEDR[0] = (printnum1<printnum2) ? 1:0;
end
end 
else begin
LEDR[2] = (printnum1==printnum2) ? 1:0; //compares absolute value of numbers. how to add negative?
LEDR[1] = (printnum1>printnum2) ? 1:0;
LEDR[0] = (printnum1<printnum2) ? 1:0;
end
end


endmodule





