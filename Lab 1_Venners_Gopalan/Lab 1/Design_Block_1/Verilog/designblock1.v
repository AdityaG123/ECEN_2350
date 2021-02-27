module designblock1(SW , KEY , LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
 input [7:0]SW;
 input [1:0]KEY;
 output wire [9:0] LEDR;
 output wire[7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; //HEX? has multiple hexs and parts of hex?
wire [23:0]Bday;
parameter Bday1 = 24'b0001_0010_0000_0100_1001_1001; //120499
parameter Bday2 = 24'b0000_0110_0000_0110_0000_0000; //060600
  
assign Bday = KEY[0] ? Bday1 : Bday2;
print7seg U0 (.num(Bday[23:20]), .HEX(HEX5));
print7seg U1 (.num(Bday[19:16]), .HEX(HEX4));
print7seg U2 (.num(Bday[15:12]), .HEX(HEX3));
print7seg U3 (.num(Bday[11:8]), .HEX(HEX2));
print7seg U4 (.num(Bday[7:4]), .HEX(HEX1));
print7seg U5 (.num(Bday[3:0]), .HEX(HEX0));

// always @(SW(7:0)) //need always? these could all be checked at same time. so i dont think soo...
assign LEDR[7:0] = KEY[1] ? ~SW[7:0]:SW[7:0];
assign LEDR[9:8] = 0; //If switch is true, then LED off? is that how assign works?
// assign LEDR[6] = SW[6] ? 0:1;
// assign LEDR[5] = SW[5] ? 0:1;
// assign LEDR[4] = SW[4] ? 0:1;
// assign LEDR[3] = SW[3] ? 0:1;
// assign LEDR[2] = SW[2] ? 0:1;
// assign LEDR[1] = SW[1] ? 0:1;
// assign LEDR[0] = SW[0] ? 0:1;

endmodule
