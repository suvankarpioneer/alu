module inverter (output [3:0] out, input [3:0] A);
assign out= ~A;
endmodule

// testbench for the above circuit

module inverter_tb;
wire [3:0] tout;
reg [3:0] tA;
inverter I1(tout, tA);
initial begin
 	$dumpfile("inverter.vcd");
	$dumpvars(0,inverter_tb);
	end
parameter  stoptime= 50;
initial fork
	tA = 4'b0000;
	#10 tA = 4'b1010;
	#20 tA = 4'b1111;
	#30 tA = 4'b0001;
	#40 tA = 4'b1000;
	join
initial #stoptime $finish;
endmodule