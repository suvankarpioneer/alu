module bitwise_and (output [3:0] out, input [3:0] A, B);
assign out = A&B;
endmodule

// testbench for the above circuit

module bitand_tb;
wire [3:0] tout;
reg [3:0] tA, tB;
parameter stoptime= 50;
bitwise_and A1(tout, tA, tB);
initial begin
	$dumpfile("bitwise_and.vcd");
	$dumpvars(0, bitand_tb);
	end
initial fork
	tA= 4'b0000;
	tB= 4'b0000;
	#10 tA= 4'b0101;
	#10 tB= 4'b1010;
	#20 tA= 4'b1100;
	#20 tB= 4'b1110;
	#30 tA= 4'b0101;
	#30 tB= 4'b0101;
	#40 tA= 4'b1111;
	#40 tB= 4'b1111;
	join
initial #stoptime $finish;
endmodule