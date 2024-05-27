`timescale 1ns / 1ps
`timescale 1ns / 1ps


module ztj(clr1,clk1,clr2,s,m,ld,q,f1);
input clr1,clk1,clr2,ld;
input[4:0]q;
output [4:0]s;
output m,f1;


parameter [15:0] xulie=16'b0110111000100100;  //产生的序列
wire [4:0] q1;   //检测的序列

reg [4:0]s;
reg [30:0]count=0;
reg [15:0] wo = 0; 
reg m,f,f1;
reg [4:0]z = 0;
reg[4:0]q2;



always @(posedge clk1,negedge clr1)
      if (~clr1)  f<=0;   
      else if (ld) wo<=xulie;
           else begin   wo[0]<=wo[15];
                        f<=wo[15];
                        wo[15:1]<=wo[14:0]; 
                end


  always @(posedge clk1 or negedge clr2)
    begin
       if (~clr2) q2<= 0; 
       else 
       begin
            m<= 0;
          case  (q2)
            0 : if (f==q1[4]) begin q2<=1;m<= 0; end else q2<= 0;
            1 : if (f==q1[3]) begin q2<=2;m<= 0; end else q2<= 0;
            2 : if (f==q1[2]) begin q2<=3;m<= 0; end else q2<= 2;
            3 : if (f==q1[1]) begin q2<=4;m<= 0; end else q2<= 0;
            4 : if (f==q1[0]) begin q2<=2;m<= 1; end else q2<= 0;
            default:  begin q2<=0;m<= 0;end
          endcase
          end
     end
 
   always @(posedge clk1)
      begin
         f1 <= f;
        z[4:1]=z[3:0];
        z[0]=f;
        s<=z;      
      end
      
 assign q1 =q;
      endmodule
      