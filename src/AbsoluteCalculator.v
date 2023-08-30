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
** Module Name: AbsoluteCalculator
**********************************************************
** Additional Comments:
*/

module AbsoluteCalculator(
	signedNumber,
	absoluteNumber
    );
input [7:0]signedNumber;
output [7:0]absoluteNumber; 
wire cout;

	Fulladder_8bit absolute(8'b0, signedNumber, signedNumber[7], absoluteNumber, cout);
	
endmodule
