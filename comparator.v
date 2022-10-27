// 4-bit comparator
module comparator(output Greater, output Lesser, output Equal, input [3:0] A,B);
reg Greater, Lesser, Equal;
always@(A or B)
if (A>B) begin
	assign Greater = 1;
	assign Lesser = 0;
	assign Equal = 0;
	end
else if(A<B) begin
	assign Lesser = 1;
	assign Greater = 0;
	assign Equal = 0;
	end
else if(A==B) begin
	assign Equal = 1;
	assign Greater = 0;
	assign Lesser = 0;
	end
endmodule

// testbench for the above circuit

module comp_tb;
wire tG, tL, tE;
reg [3:0] tA, tB;
parameter stoptime =45;
comparator C1(tG, tL, tE, tA,tB);
initial begin
	$dumpfile("comparator.vcd");
	$dumpvars(0,comp_tb);
end
initial fork
	tA= 4'b1010;
	tB= 4'b0101;
	#15 tA= 4'b1011;
	#15 tB= 4'b1011;
	#30 tA= 4'b1111;
	#30 tB= 4'b0001;
	join
initial #stoptime $finish;
endmodule









