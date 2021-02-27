module designblock2(SW,KEY,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input [9:0]SW;
input [1:0] KEY;
output wire [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output wire [9:0] LEDR;
wire [3:0] x,y,inputy, initialx,initialy;
wire [3:0] sum;
wire carry1, carry2, carry3, carryfin; 
wire [3:0] negative1, negative2, negative3, overflow,ansneg;
wire [3:0] first, second,third,final;

assign x = SW[7:4];
assign y= KEY[0] ? SW[3:0] : ~SW[3:0];
//assign y = (negative2[2]) ? initialy[3:0]:~initialy[3:0]+1;
assign inputy = SW[3:0];
assign LEDR[9:0] = 0;

full_adder U0 (.Cin(~KEY[0]),.a(x[0]),.b(y[0]),.sum(sum[0]),.Cout(carry1));
full_adder U1 (.Cin(carry1),.a(x[1]),.b(y[1]),.sum(sum[1]),.Cout(carry2));
full_adder U2 (.Cin(carry2),.a(x[2]),.b(y[2]),.sum(sum[2]),.Cout(carry3));
full_adder U3 (.Cin(carry3),.a(x[3]),.b(y[3]),.sum(sum[3]),.Cout(carryfin)); //maybe add another adder to figure overflow but thats it?

assign negative1 = x[3] ? 4'b1011 : 4'b1111; //prints negative if 1 is first value of x negative[2]=0 when negative
print7seg U4 (.num(negative1), .HEX(HEX5));
assign negative2 = inputy[3] ? 4'b1011 : 4'b1111; //prints negative if 1 is first value of y
print7seg U5 (.num(negative2), .HEX(HEX3));
assign negative3 = sum[3] ? 4'b1011 : 4'b1111;
assign ansneg = negative3[2] ? sum[3:0] :~sum[3:0]+1;
assign overflow = (ansneg>4'b0111) ? 4'b0000 : negative3[3:0];
print7seg U8 (.num(overflow), .HEX(HEX1));

assign first[3:0] = negative1[2] ? x[3:0]:~x[3:0]+1;
assign second[3:0] = negative2[2] ? inputy[3:0]:~inputy[3:0]+1;
assign third[3:0] = negative3[2] ? sum[3:0]:~sum[3:0]+1;

print7seg U6 (.num(first), .HEX(HEX4));
print7seg U7 (.num(second), .HEX(HEX2));

assign final[3:0] = (third[3:0]>=4'b1000) ? 4'b1010:third[3:0];
print7seg U9 (.num(final), .HEX(HEX0));



endmodule