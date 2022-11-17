// binary to gray converter

module binary_to_gray (output [3:0] G, input [3:0] bin);
assign G[3] = bin[3];
assign G[2] = bin[3]^bin[2];
assign G[1] = bin[3]^bin[2]^bin[1];
assign G[0] = bin[3]^bin[2]^bin[1]^bin[0];
endmodule

// testbench for the above circuit
module b2g_tb;
wire [3:0] tG;
reg [3:0] tbin;
parameter stoptime=60;
binary_to_gray BG1(tG, tbin);
initial begin
	$dumpfile("binary_to_gray.vcd");
	$dumpvars(0, b2g_tb);
	end
initial fork 
	tbin= 4'b0011;
	#15 tbin= 4'b1001;
	#30 tbin= 4'b1110;
	#45 tbin= 4'b0000;
	join
initial #stoptime $finish;
endmodule