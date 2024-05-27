`timescale 1ns / 1ps
module cnt(clk,en,rst,mod1,SG,flag,set);
    input clk,rst,en,set;
    input [7:0]mod1;
    output [10:0]SG;
    output flag;

    reg flag;
    reg [7:0]q;
    reg[6:0]SG0,SG1,SG2,SG3;
    reg [10:0]SG;
    reg clk1;
    reg [7:0]mod = 8'b00000100;
    wire [3:0]gw,sw,mosw,mogw;
    reg [19:0]count=0; 
    reg [30:0]count2=0; 
    reg [2:0] sel=0; 
    parameter T1MS=50000;
    
always@(posedge clk) 
     begin 
        count<=count+1; 
        if(count==T1MS) 
        begin 
            count<=0; 
            sel<=sel+1; 
            if(sel==3) 
            sel<=0; 
         end 
     end
        
always @(posedge clk)
	begin count2=count2+1;
		if(count2/10000000%2==1)	begin clk1=1'b1; count2=0;end
		else clk1=1'b0;
	end
	
always@(posedge clk) 
 begin 
    case(sel) 
        0:SG<={4'b0111,SG3};
        1:SG<={4'b1011,SG2};
        2:SG<={4'b1101,SG1};
        3:SG<={4'b1110,SG0};
        default:SG<=11'b1111_1111111; 
    endcase 
 end
 
 	
    always @(posedge clk1,negedge rst,negedge set)
    begin   
        if (rst||set) q=0;
        else if (en)
             begin
                 if (q<mod-2)
                     begin
                          if (gw==9) begin q=q+7;  end  //BCDµ÷Õû
                          else begin q=q+1; flag <= 0;end   
                          
                     end
                 else if (q==mod-2) begin flag <= 1;q=q+1; end
                 else  begin q=0;flag <= 0;end
             end
     end
     
     
    always @(posedge set)
    begin
    mod<=mod1;
    end
    assign gw=q[3:0];
    assign sw=q[7:4];
    assign mogw=mod[3:0];
    assign mosw=mod[7:4];
 
    always @(posedge clk)
    
    begin
            case (gw)
            0:SG0<=7'b0000001; 1:SG0<=7'b1001111;
            2:SG0<=7'b0010010; 3:SG0<=7'b0000110;
            4:SG0<=7'b1001100; 5:SG0<=7'b0100100;
            6:SG0<=7'b0100000; 7:SG0<=7'b0001111;
            8:SG0<=7'b0000000; 9:SG0<=7'b0000100; //7¶ÎÒëÂëÖµ
           default: SG0=7'b0000000;
         endcase
         case (sw)
            0:SG1<=7'b0000001; 1:SG1<=7'b1001111;
            2:SG1<=7'b0010010; 3:SG1<=7'b0000110;
            4:SG1<=7'b1001100; 5:SG1<=7'b0100100;
            6:SG1<=7'b0100000; 7:SG1<=7'b0001111;
            8:SG1<=7'b0000000; 9:SG1<=7'b0000100; //7¶ÎÒëÂëÖµ
           
           default: SG1=7'b0000000;
         endcase
         case (mogw)
            0:SG2<=7'b0000001; 1:SG2<=7'b1001111;
            2:SG2<=7'b0010010; 3:SG2<=7'b0000110;
            4:SG2<=7'b1001100; 5:SG2<=7'b0100100;
            6:SG2<=7'b0100000; 7:SG2<=7'b0001111;
            8:SG2<=7'b0000000; 9:SG2<=7'b0000100; //7¶ÎÒëÂëÖµ
           default: SG2=7'b0000000;
         endcase 
         
         case (mosw)
            0:SG3<=7'b0000001; 1:SG3<=7'b1001111;
            2:SG3<=7'b0010010; 3:SG3<=7'b0000110;
            4:SG3<=7'b1001100; 5:SG3<=7'b0100100;
            6:SG3<=7'b0100000; 7:SG3<=7'b0001111;
            8:SG3<=7'b0000000; 9:SG3<=7'b0000100; //7¶ÎÒëÂëÖµ
           default: SG3=7'b0000000;
         endcase 
         
          
end
endmodule