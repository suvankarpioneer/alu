// 1-bit decrementer
module decrementer(output [3:0] S, input [3:0] A);
assign S[0]= ~A[0];
assign S[1]= ~(A[0]^A[1]);
assign S[2]= ~(A[2]^(A[0]||A[1]));
assign S[3]= ~(A[3]^(A[2]||A[1]||A[0]));
endmodule

// test bench for the above circuit

module decr_tb;
wire [3:0] tS;
reg [3:0] tA;
decrementer A1(tS, tA);
parameter stoptime =50;
initial begin
	$dumpfile("decrementer.vcd");
	$dumpvars(0,decr_tb);
end
initial fork
	tA= 4'b0000;
	#25 tA= 4'b1011;
	join
initial #stoptime $finish;
endmodule