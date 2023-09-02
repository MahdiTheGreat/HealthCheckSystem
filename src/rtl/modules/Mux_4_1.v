`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:00 11/13/2019 
// Design Name: 
// Module Name:    Mux_4_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux_4_1(i0, i1, i2, i3, E, s0, s1, y);
	input i0, i1, i2, i3, E, s0, s1;
	output y;
	wire s0n, s1n, o0, o1, o2, o3;
	
	not gn0(s0n, s0);
	not gn1(s1n, s1);
	
	and ga0(o0, i0, s1n, s0n, E);
	and ga1(o1, i1, s1n, s0, E);
	and ga2(o2, i2, s1, s0n, E);
	and ga3(o3, i3, s1, s0, E);
	
	or goo(y, o0, o1, o2, o3);
	
endmodule
