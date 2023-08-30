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
** Module Name: Fulladder_4bit
**********************************************************
** Additional Comments:
*/

module Fulladder_4bit(A, B, select, cin, cout, S);
input [3:0] A;
input [3:0] B;
input select;
input cin;
output cout;
output [3:0] S;
wire c_1, c_2, c_3;
	
	Fulladder_2bit f0(A[0], B[0], select, cin, c_1, S[0]);
	Fulladder_2bit f1(A[1], B[1], select, c_1, c_2, S[1]);
	Fulladder_2bit f2(A[2], B[2], select, c_2, c_3, S[2]);
	Fulladder_2bit f3(A[3], B[3], select, c_3, cout, S[3]);

endmodule
