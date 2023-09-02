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
** Module Name: Comparator8Bit
**********************************************************
** Additional Comments:
*/

module Comparator8Bit(
        inputP,
        inputQ,
        pLessThanQ,
        pEqualToQ,
        pGraterGreaterThanQ
        );
input [7:0] inputP;
input [7:0] inputQ;
output pLessThanQ;
output pEqualToQ;
output pGraterGreaterThanQ;
wire wLt0, wEq0, wGt0, wLt1, wEq1, wGt1;
wire [8:0]A;
wire [8:0]B;
	
	assign A = {0, inputP};
	assign B = {0, inputQ};
	
	Comparator3Bit C1(A[2:0], B[2:0], 1'b0, 1'b1, 1'b0, wLt0, wEq0, wGt0);
	Comparator3Bit C2(A[5:3], B[5:3], wLt0, wEq0, wGt0, wLt1, wEq1, wGt1);
	Comparator3Bit C3(A[8:6], B[8:6], wLt1, wEq1, wGt1, pLessThanQ, pEqualToQ, pGraterGreaterThanQ);
	
endmodule
