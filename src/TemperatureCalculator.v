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
** Module Name: TemperatureCalculator
**********************************************************
** Additional Comments:
*/

module TemperatureCalculator(
        factoryBaseTemp,
        factoryTempCoef,
        tempSensorValue,
        temperature);
input [7:0] factoryBaseTemp;
input [3:0] factoryTempCoef;
input [3:0] tempSensorValue;
output [7:0] temperature;
wire [7:0] p;
wire cout;

	Multiplier multiplier(tempSensorValue, factoryTempCoef, p);
	Fulladder_8bit adder(factoryBaseTemp, {"000", p[7:3]}, 0, temperature, cout);

endmodule
