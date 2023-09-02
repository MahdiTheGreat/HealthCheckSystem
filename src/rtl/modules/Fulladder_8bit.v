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
** Module Name: Fulladder_8bit
**********************************************************
** Additional Comments:
*/

module Fulladder_8bit(a, b, select, s, cout);
input [7:0] a;
input [7:0] b;
input select;
output [7:0] s;
output cout;
wire wcout;

	Fulladder_4bit fa0(a[3:0], b[3:0], select, select, wcout, s[3:0]);
	Fulladder_4bit fa1(a[7:4], b[7:4], select, wcout, cout, s[7:4]);

endmodule
