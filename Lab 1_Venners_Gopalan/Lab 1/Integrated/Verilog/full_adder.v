module full_adder(Cin,a,b,sum,Cout);
input Cin,a,b;
output wire sum, Cout;
assign sum = Cin ^ a ^ b; //if two 1s sum = 0, if 3 1s sum = 1, if only 1 1 then sum = 1
assign Cout = (a & b) | (a & Cin) | (b & Cin); //if there are atleast two ones in inputs
endmodule