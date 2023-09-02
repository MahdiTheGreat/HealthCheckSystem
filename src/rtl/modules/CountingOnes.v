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
** Module Name: CountingOnes
**********************************************************
** Additional Comments:
*/

module CountingOnes(
	absoluteNumber,
	out
    );
input [7:0] absoluteNumber;
output [3:0] out;
wire [1:0] L00;
wire [1:0] L01;
wire [1:0] L02;
wire [1:0] L03;
wire[3:0] L10;
wire[3:0] L11;
wire cout10, cout11, cout20;

	Fulladder_2bit line0_0(absoluteNumber[0], absoluteNumber[1], 1'b0, 1'b0, L00[1], L00[0]);
	Fulladder_2bit line0_1(absoluteNumber[2], absoluteNumber[3], 1'b0, 1'b0, L01[1], L01[0]);
	Fulladder_2bit line0_2(absoluteNumber[4], absoluteNumber[5], 1'b0, 1'b0, L02[1], L02[0]);
	Fulladder_2bit line0_3(absoluteNumber[6], absoluteNumber[7], 1'b0, 1'b0, L03[1], L03[0]);
	
	Fulladder_4bit line1_0({0, L00}, {0, L01}, 0, 0, cout10, L10);
	Fulladder_4bit line1_1({0, L02}, {0, L03}, 0, 0, cout11, L11);
	Fulladder_4bit line2_0(L10, L11, 0, 0, cout20, out);
	
endmodule
