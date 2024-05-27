`timescale 1ns / 1ps
module cnt(clk,en,rst,mod,SG,lit);
    input clk,rst,en;
    input [11:0]mod;
    output [6:0]SG;
    output [3:0]lit;
    reg[11:0]q;
    reg[6:0]SG0,SG1,SG2;
    reg [7:0]SG;
    reg [3:0]lit;
    reg times,clk1,cnt1;
    wire [3:0]gw,sw,bw;

 always @(posedge clk )
         if (cnt1<4999999) begin cnt1=cnt1+1;  clk1=1'b0 ; end
         else  begin cnt1=0;clk1 = 1'b1; end  
    always @(posedge clk1,negedge rst)
    begin   
        if (!rst) q=0;
        else if (en)
             begin
                 if (q<mod)
                     begin
                          if (gw==9) begin q=q+7; if (sw==9) q=q+96; end  //BCDµ÷Õû
                          else q=q+1;            
                     end
                 else  q=0;
             end
     end
    assign gw=q[3:0];
    assign sw=q[7:4];
    assign bw=q[11:8];
 
    always @(posedge clk1)
    begin
         case (gw)
            0:SG0<=7'b1000000; 1:SG0<=7'b1111001;
            2:SG0<=7'b0100100; 3:SG0<=7'b0110000;
            4:SG0<=7'b0011001; 5:SG0<=7'b0010010;
            6:SG0<=7'b0000010; 7:SG0<=7'b1111000;
            8:SG0<=7'b0000000; 9:SG0<=7'b0010000; //7¶ÎÒëÂëÖµ
           default: SG0=7'b0000000;
         endcase
         case (sw)
            0:SG1<=7'b1000000; 1:SG1<=7'b1111001;
            2:SG1<=7'b0100100; 3:SG1<=7'b0110000;
            4:SG1<=7'b0011001; 5:SG1<=7'b0010010;
            6:SG1<=7'b0000010; 7:SG1<=7'b1111000;
            8:SG1<=7'b0000000; 9:SG1<=7'b0010000; //7¶ÎÒëÂëÖµ
           default: SG1=7'b0000000;
         endcase
         case (bw)
            0:SG2<=7'b1000000; 1:SG2<=7'b1111001;
            2:SG2<=7'b0100100; 3:SG2<=7'b0110000;
            4:SG2<=7'b0011001; 5:SG2<=7'b0010010;
            6:SG2<=7'b0000010; 7:SG2<=7'b1111000;
            8:SG2<=7'b0000000; 9:SG2<=7'b0010000; //7¶ÎÒëÂëÖµ
           default: SG2=7'b0000000;
         endcase 
   end
 
 always@(posedge clk1) 
 begin 
 if(times!=(0|1|2))  times<=0;
    else if (times==0) begin times=times+1; SG[7:1]<=SG0;SG[0]<=1;lit<=4'b0001;end      
    else if (times==1) begin times=times+1; SG[7:1]<=SG1;SG[0]<=1;lit<=4'b0010;end
    else if (times==2) begin times=times+1; SG[7:1]<=SG2;SG[0]<=1;lit<=4'b0100;end
 end 

endmodule


