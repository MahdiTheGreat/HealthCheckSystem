`timescale 1ns / 1ps
`default_nettype none

/*
**********************************************************
** Logic Design Final Project Fall, 2019 Semester
** Amirkabir University of Technology (Tehran Polytechnic)
** Department of Computer Engineering (CEIT-AUT)
** Logic Circuit Design Laboratory
** https://ceit.aut.ac.ir
**********************************************************
** Student ID: 9623105
** Student ID: 9731131
**********************************************************
** Module Name: Multiplier
**********************************************************
** Additional Comments:
*/

module Multiplier(a, b, c);

input [3:0] a;
input [3:0] b;
output [7:0] c;
wire wb0a0 ,wb0a1 ,wb0a2 ,wb0a3 ,wb1a0 ,wb1a1 ,wb1a2 ,wb1a3 ,wb2a0 ,wb2a1 ,wb2a2 ,wb2a3 ,wb3a0 ,wb3a1 ,wb3a2 ,wb3a3;
wire fa0o,fa1o,fa2o,fa3o,fa4o,fa5o,fa6o,fa7o,fa8o,fa9o,fa10o,fa11o;
wire fa0s,fa1s,fa2s,fa3s,fa4s,fa5s,fa6s,fa7s,fa8s,fa9s,fa10s,fa11s;

	and b0a0(c[0],b[0],a[0]);
	and b0a1(wb0a1,b[0],a[1]);
	and b0a2(wb0a2,b[0],a[2]);
	and b0a3(wb0a3,b[0],a[3]);
	and b1a0(wb1a0,b[1],a[0]);
	and b1a1(wb1a1,b[1],a[1]);
	and b1a2(wb1a2,b[1],a[2]);
	and b1a3(wb1a3,b[1],a[3]);
	and b2a0(wb2a0,b[2],a[0]);
	and b2a1(wb2a1,b[2],a[1]);
	and b2a2(wb2a2,b[2],a[2]);
	and b2a3(wb2a3,b[2],a[3]);
	and b3a0(wb3a0,b[3],a[0]);
	and b3a1(wb3a1,b[3],a[1]);
	and b3a2(wb3a2,b[3],a[2]);
	and b3a3(wb3a3,b[3],a[3]);
	
	Fulladder_2bit line0_0(wb1a0,wb0a1,0,0,fa0o,c[1]);
	Fulladder_2bit line0_1(wb1a1,wb0a2,0,fa0o,fa1o,fa1s);
	Fulladder_2bit line0_2(wb1a2,wb0a3,0,fa1o,fa2o,fa2s);
	Fulladder_2bit line0_3(wb1a3,0,0,fa2o,fa3o,fa3s);
	Fulladder_2bit line2_0(wb2a0,fa1s,0,0,fa4o,c[2]);
	Fulladder_2bit line2_1(wb2a1,fa2s,0,fa4o,fa5o,fa5s);
	Fulladder_2bit line2_2(wb2a2,fa3s,0,fa5o,fa6o,fa6s);
	Fulladder_2bit line2_3(wb2a3,fa3o,0,fa6o,fa7o,fa7s);
	Fulladder_2bit line3_0(wb3a0,fa5s,0,0,fa8o,c[3]);
	Fulladder_2bit line3_1(wb3a1,fa6s,0,fa8o,fa9o,c[4]);
	Fulladder_2bit line3_2(wb3a2,fa7s,0,fa9o,fa10o,c[5]);
	Fulladder_2bit line3_3(wb3a3,fa7o,0,fa10o,c[7],c[6]);
	
endmodule
