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
** Module Name: Comparator3Bit
**********************************************************
** Additional Comments:
*/

module Comparator3Bit(A, B, L, E, G, Lt, Eq, Gt);
	input [2:0]A;
	input [2:0]B;
	input L, E, G;
	output Lt, Eq, Gt;
	wire wEq0, wEq1, wEq2, wEq, B0n, B1n, B2n,
		wGt0, wGt1, wGt2, wGt, wLt_1, wLt_2;
		
	not gB0n(B0n, B[0]);
	not gB1n(B1n, B[1]);
	not gB2n(B2n, B[2]);
	
	xnor gEq0(wEq0, A[0], B[0]);
	xnor gEq1(wEq1, A[1], B[1]);
	xnor gEq2(wEq2, A[2], B[2]);
	and gEq(wEq, wEq0, wEq1, wEq2);
	and gEqEq(Eq, wEq, E);
	and gEqGt(wGt, wEq, G); 
	
	and gGt2(wGt2, B2n, A[2]);
	and gGt1(wGt1, B1n, A[1], wEq2);
	and gGt0(wGt0, B0n, A[0], wEq2, wEq1);
	or gGt(Gt, wGt0, wGt1, wGt2, wGt);
	
	nor gLt(Lt, Gt, Eq);
endmodule