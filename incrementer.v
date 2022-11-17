// 1-bit incrementer
module incrementer (output C_out, output [3:0] S, input [3:0] A);
wire W0, W1;
assign S[0]= ~A[0];
assign S[1]= A[1]^A[0];
assign S[2]= A[2]^(A[1]&&A[0]);
assign S[3]= A[3]^(A[2]&&A[1]&&A[0]);
assign C_out= A[3]&&A[2]&&A[1]&&A[0];
endmodule

//test bench for the above circuit

module incr_tb;
wire [3:0] tS;
wire tC_out;
reg [3:0] tA;
incrementer A1(tC_out, tS, tA);
parameter stoptime =50;
initial begin
	$dumpfile("incrementer.vcd");
	$dumpvars(0,incr_tb);
end
initial fork
	tA= 4'b1010;
	#25 tA= 4'b1011;
	join
initial #stoptime $finish;
endmodule