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
** Student ID: XXXXXXX
** Student ID: XXXXXXX
**********************************************************
** Module Name:
**********************************************************
** Additional Comments:
*/

module BloodPHAnalyzer(ph,abnormalp,abnormalq);
input [3:0]ph;
output abnormalp,abnormalq;
wire wn0,wn1,wn2,wn3,wa0,wa1,wa2,wa3,wo0,wo1;
not a(wn3,ph[3]);
not b(wn2,ph[2]);
not c(wn1,ph[1]);
not d(wn0,ph[0]);
and a0(wa0,wn3,ph[1],ph[2]);
and a1(wa1,ph[3],wn1,wn2);
and a2(wa2,ph[0],wa0);
and a3(wa3,wn0,wa1);
nor o0(abnormalq,wa0,wa1);
nor o1(abnormalp,wa2,wa3);

endmodule
