`timescale 1ns / 1ps

module cnt(clk,en,rst,mod1,q,flag,set,mod);
    input clk,rst,en;
    input [7:0]mod1;
    input set;
    output [7:0]q;
    output flag;
    output [7:0]mod;
    
    
    reg [7:0]mod = 8'b00000100;
    reg flag=0;
    reg[7:0]q;

    wire [3:0]gw,sw;
    
    always @(posedge clk,negedge rst,negedge set)
    begin   
        if (rst) q=0;
 
        else if (en)
             begin
                 
                 if (q<mod-1)
                     begin

                          if (gw==9) begin q=q+7; end  //BCDµ÷Õû
                          else begin q=q+1;flag <= 1'b0;end          
                     end
                 else  begin q=0;flag <= 1'b0; end
             end
     end
    always @(posedge set)   
      begin 
      mod <= mod1;
 
      end
    always @(negedge set)   
      begin 

      q <= 8'b0;
      end 
      
      
      always @(posedge clk)
      begin
      if (q ==mod-1) flag <= 1'b1;
      end
    assign gw=q[3:0];
    assign sw=q[7:4];
    
         
 endmodule
 
