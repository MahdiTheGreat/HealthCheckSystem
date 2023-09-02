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
** Module Name: Fulladder_2bit
**********************************************************
** Additional Comments:
*/

module Fulladder_2bit(a, b, select, cin, cout, s);
input a, b, select, cin;
output cout, s;
wire w0, w1, w2, w3;
	
	and g0(w2, a, w0);
	and g1(w3, cin, w1);

	or  g2(cout, w3, w2);

	xor g3(w0, b, select);
	xor g4(w1, w0, a);
	xor g5(s, w1, cin);
	
endmodule