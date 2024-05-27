`timescale 1ns / 1ps

module ztjtest(

    );
    reg clk,ld,en,clr2;
    reg [4:0]q;
    
    wire [4:0]s;
    wire m,f;
    
 ztj myztj(en,clk,clr2,s,m,ld,q,f)   ;
 always #1 clk = ~clk;
initial 
    begin
     clk = 0;

    ld = 0;
    en = 0;
    clr2 = 0;    
    q = 5'b00100;
    repeat(5)
   #20 en =~ en;
    #20 clr2 =~ clr2;
    #2  ld= ~ld;
    #2 ld = ~ld;

    end
endmodule
