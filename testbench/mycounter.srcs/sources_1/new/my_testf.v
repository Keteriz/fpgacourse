`timescale 0.1ns / 1ps


module my_testf(

    );
reg clk,reset,en,set;
reg [7:0]mod;

wire[7:0]q1;   
wire flag1;
wire [7:0]mod1;

 
    
cnt mycnt(clk,en,reset,mod,q1,flag1,set,mod1);    
always #1 clk= ~clk;

        
        initial 
    begin
    clk = 1;
    reset=0;
    en = 1;
    set = 0;
    mod = 8'b00010010;


    repeat(5)

    
    #2 set = ~set;
    #2 set = ~set;
    #500 mod=mod+64;
    #1 set = ~set;
    #1 set = ~set;

    end    
 initial 
    begin
    clk = 1;
    reset=0;
    en = 1;
    set = 0;
    mod = 8'b00010010;

    repeat(5)
    #3000 en = ~en;
    #50 en = ~en;
    end       
initial 
    begin
    clk = 1;
    reset=0;
    en = 1;
    set = 0;
    mod = 8'b00010010;

    repeat(3)
    # 400;
    #2 reset = ~reset;
    #2 reset = ~reset;
    end           
    
    
endmodule
