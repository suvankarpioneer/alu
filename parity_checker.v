module parity_check( input [3:0] A, output reg out );
integer count = 0;
integer i = 0;
always@(A)
begin
    for(i=0; i<=3; i++)
    begin
        if(A[i]==1)
        count= count+1;
    end
    if(count%2==0.0) 
    out = 1;
    else
    out = 0;
    end
endmodule

module par_tb;
wire tout;
reg [3:0] tA;
parameter stoptime= 50;
parity_check P1( tA, tout);
initial begin
	$dumpfile("par_tb.vcd");
	$dumpvars(0, par_tb);
end
initial fork
	tA= 4'b1010;
	#10 tA= 4'b1000;
	#20 tA= 4'b1100;
	#30 tA= 4'b1101;
	#40 tA= 4'b0000;
	join
initial #stoptime $finish;
endmodule