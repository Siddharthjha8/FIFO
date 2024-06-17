`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:19:21
// Design Name: 
// Module Name: synchronizer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module synchronizer(clk,reset,in,out);
input clk,reset;
input [4:0] in;
output reg [4:0]out;
reg out1;
always@(posedge clk or posedge reset)
begin
if(reset)
{out,out1}<=0;
else
begin
out1<=in;
out<=out1;
end
end
endmodule
