`timescale 1ns / 1ps

module h_adder(A,B,SO,CO);
    input A,B;
    output SO,CO;
    assign SO = A ^ B;
    assign CO = A & B;
endmodule

module full_adder(ain,bin,cin,sum,cout);
    output cout,sum;
    input ain,bin,cin;
    wire net1,net2,net3;
    h_adder U1(ain, bin, net1, net2);
    h_adder U2(.A(net1), .SO(sum), .B(cin), .CO(net3));
        or  U3(cout , net2, net3); 
endmodule

 module adder(a,b,ci,sum,co);
input [3:0] a;
input[3:0]b;
input ci;
output[3:0] sum;
output co;
wire[3:0] count;

full_adder u0(a[0],b[0],ci,sum[0],count[0]);
full_adder u1(a[1],b[1],count[0],sum[1],count[1]);
full_adder u2(a[2],b[2],count[1],sum[2],count[2]);
full_adder u3(a[3],b[3],count[2],sum[3],count[3]);
assign co = count[3];
endmodule