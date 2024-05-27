`timescale 1ns / 1ps
module tb_adder(

    );

reg [3:0] a,b;
reg ci;

wire [3:0] sum;
wire co;




always #80 ci=~ci;
initial 
	begin
	a=4'b0000;b = 4'b0000;ci=0;
	repeat(256)
	#10 a=a+1;
	end
	
	initial 
	begin
	a=4'b0000;b = 4'b0000; ci=0;
	repeat(64)
	#40 b=b+1;
	end
	
adder tb_adder(
    .a(a), 
	.b(b), 
	.ci(ci), 
	.sum(sum), 
	.co(co)
);
endmodule

