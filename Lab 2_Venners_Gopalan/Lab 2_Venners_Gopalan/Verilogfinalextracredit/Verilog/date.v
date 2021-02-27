module date(clock,reset,counter,bigcounter,HEX0,HEX1,HEX2,HEX3);
input clock,reset;
input [3:0] counter, bigcounter;
output wire [7:0] HEX0,HEX1,HEX2,HEX3;

reg [3:0] month,datetens,dateones,fakebigcounter,datetenscounter;
reg [9:0] num;
reg [6:0] binary_date;

always @(counter)
begin
    if(bigcounter == 4'b1111) begin
    fakebigcounter <= 4'b0000;
    end
    else begin
    fakebigcounter <= bigcounter;
    end
    //binary_date <= (fakebigcounter*10) + ({3'b0,counter});                        //less than 31 means in jan
  if((fakebigcounter == 4'b0011 && counter<= 4'b0001) || fakebigcounter <= 4'b0010)
  begin
    month <= 4'b0001;
    datetens <= bigcounter;
    dateones <= counter;
    end
  else if(fakebigcounter <= 4'b0101) //feb
  begin
    month <= 4'b0010;
    if(counter>=4'b0001) 
      dateones <= counter - 1;
      else
      dateones <= 4'b1001;
if((fakebigcounter == 4'b0011 && counter <= 4'b1001) || (fakebigcounter == 4'b0100 && counter == 4'b0000)) begin
datetens = 4'b1111;
end
if((fakebigcounter == 4'b0100 && counter >= 4'b0001) || fakebigcounter == 4'b0101 && counter == 4'b0000) begin
datetens = 4'b0001;
end
if(fakebigcounter == 4'b0101 && counter >= 4'b0001) begin
datetens = 4'b0010;
end
  end
  else if((fakebigcounter == 4'b1001 && counter == 0) || fakebigcounter <= 4'b1000) begin //march
    month <= 4'b0011;
    if(counter <= 4'b1000) begin
    dateones <= (counter + 4'b0001);
    end
    else begin
    dateones <= 4'b0000;
    end
    // if (dateones == 4'b1111) begin
    //   dateones <= 4'b0001;
    //   end
    if(fakebigcounter == 4'b0110 && counter <= 4'b1001)
    datetens = 4'b1111;  
    if((fakebigcounter == 4'b0110 && counter == 4'b1001) || (fakebigcounter == 4'b0111 && counter <=4'b1000))
     datetens = 4'b0001;
    if((fakebigcounter == 4'b0111 && counter == 4'b1001) || (fakebigcounter == 4'b1000 && counter <=4'b1000))
     datetens = 4'b0010;
     if((fakebigcounter == 4'b1000 && counter == 4'b1001) || (fakebigcounter == 4'b1001))
     datetens = 4'b0011;
    // else if(counter == 4'b1001)
    //   datetens = fakebigcounter - 4'b0110;
    //   if(datetens == 4'b0000) begin
    //   datetens = 4'b1111;
    //   end
  end
  else begin //april
  month <= 4'b0100;
  datetens <= 4'b1111;
  dateones <= counter;
    if (datetens == 4'b0000) begin
    datetens <= 4'b1111;    
    end
    if (dateones == 4'b1111) begin
      dateones <= 4'b0000;
      end
      end

end

print7seg U0 (.num(month),.HEX(HEX2));
print7seg U1 (.num(datetens),.HEX(HEX1));
print7seg U2 (.num(dateones),.HEX(HEX0));
print7seg U3 (.num(4'b1111),.HEX(HEX3));

endmodule

