`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:44:11 12/18/2019 
// Design Name: 
// Module Name:    PressureAnalyzer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PressureAnalyzer(a,b,c,d,e,F);
input a,b,c,d,e;
output F;
wire a1,a2,a3,a4,a22,na,nb,nc,nd,f,n1,n2,n3,n4,n5;
not no1(n1,a);
not no2(n2,b);
not no3(n3,c);
not no4(n4,d);
not no5(n5,e);
and an1(a1,n1,b);
and an2(a2,n2,n3,a);
and an3(a3,n2,a,e);
and an4(a4,n2,n4,a);
and an22(a22,a,n2,c,d,n5);
or sum(f,a1,a2,a3,a4,a22);
not final(F,f);



endmodule
