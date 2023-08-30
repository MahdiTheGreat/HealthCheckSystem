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
** Module Name: GlycemicIndexCalculator
**********************************************************
** Additional Comments:
*/

module GlycemicIndexCalculator(
        bloodSensor,
        glycemicIndex);
input [7:0] bloodSensor;
output [3:0] glycemicIndex;
wire [7:0] absoluteNumber;

	AbsoluteCalculator g0(bloodSensor, absoluteNumber);
	CountingOnes g1(absoluteNumber, glycemicIndex);

endmodule