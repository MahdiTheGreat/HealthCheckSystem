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
** Module Name: PressureAbnormalityDetector
**********************************************************
** Additional Comments:
*/

module PressureAbnormalityDetector(
        pressureData,
        presureAbnormality);

input [5:0] pressureData;
output presureAbnormality;

wire error, pWarning;


	ParityErrorChecker ParityErrorCheckerUnit 
	(
		.data (pressureData),
		.error(error)
    );

    PressureAnalyzer PressureAnalyzerUnit
    (
        pressureData[4],
		  pressureData[3],
		  pressureData[2],
		  pressureData[1],
		  pressureData[0],
		  pWarning
    );

    assign presureAbnormality = (~error) & pWarning;

endmodule
