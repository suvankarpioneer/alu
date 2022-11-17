module complementer (output reg [3:0] out, input [3:0] A, input select);
always@(select or A) 
	if(select==0)
		assign out=~A;
	else
		assign out= ~A + 4'b0001;
endmodule

// testbench

module comtb;
wire [3:0] tout;
reg [3:0] tA;
reg tselect;
parameter stoptime= 70;
complementer C1(tout, tA, tselect);
initial
	begin
$dumpfile("complementer.vcd");
$dumpvars(0,comtb);
end
initial
	fork
		tselect =0;
		tA = 4'b 1010;
		#10  tA = 4'b1111;
		#20 tselect = 1;
		#20 tA = 4'b0110;
		#30 tA= 4'b1110;
		#40 tA= 4'b0000;
		#50 tA= 4'b1111;
		#60 tselect= 0;
		#60 tA= 4'b0000;
	join
initial #stoptime $finish;
endmodule