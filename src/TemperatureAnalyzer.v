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
** Module Name: TemperatureAnalyzer
**********************************************************
** Additional Comments:
*/

module TemperatureAnalyzer(
        temperature,
        temperatureAbnormality);
input [7:0] temperature;
output temperatureAbnormality;

	assign temperatureAbnormality = (temperature > 39) || (temperature < 35);

endmodule
