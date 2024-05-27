`timescale 1ns / 1ps


module ztj(clr1,clk,clr2,s,m,ld,q,f,en);
input clr1,clk,clr2,ld,en;
input[4:0]q;
output s,m,f;

parameter [15:0] xulie=16'b0111010000100100;  //产生的序列
wire [4:0] q1;   //检测的序列
reg clk1;
reg [4:0]s;
reg [30:0]count=0;
reg [15:0] wo = 0; 
reg m,f,f1;
reg [4:0]z = 0;
reg[4:0]q2;


always @(posedge clk,posedge clr1)
        if (~clr1) clk1=1'b0;
        else
	   begin count=count+1;
		if(count/50000000%2==1)	begin clk1=1'b1; count=0;end
		else clk1=1'b0;
	end

always @(posedge clk1,negedge en)
      if (~en);   
      else if (ld) wo<=xulie;
           else begin   wo[0]<=wo[15];
                        f1<=wo[15];
                        wo[15:1]<=wo[14:0]; 
                end


  always @(posedge clk1,posedge clr2 )
        if (clr2) ;
        else
       begin
            m<= 0;
          case  (q2)
            0 : if (f1==q1[4]) begin q2<=1;m<= 0; end else q2<= 0;
            1 : if (f1==q1[3]) begin q2<=2;m<= 0; end else q2<= 0;
            2 : if (f1==q1[2]) begin q2<=3;m<= 0; end else q2<= 2;
            3 : if (f1==q1[1]) begin q2<=4;m<= 0; end else q2<= 0;
            4 : if (f1==q1[0]) begin q2<=2;m<= 1; end else q2<= 0;
            default:  begin q2<=0;m<= 0;end
          endcase
          end




   always @(posedge clk1)

      begin
         f <= f1;
        z[4:1]=z[3:0];
        z[0]=f1;
        s<=z;      
      end
 assign q1 =q;
      endmodule
      
