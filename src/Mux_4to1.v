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
** Module Name: Mux_4to1
**********************************************************
** Additional Comments:
*/

module Mux_4to1(
        i0, i1, i2, i3,
        sel0, sel1,
		  Enable,
		  out);

input[1:0] sel0, sel1;
input i0, i1, i2, i3;
input Enable;
output out;

	assign out = Enable & ((sel1 == 0) ? 
	((sel0 == 0) ? i0 : i1)	: 
	((sel0 == 0) ? i2 : i3));

endmodule
