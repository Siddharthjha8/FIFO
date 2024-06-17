`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:54:49
// Design Name: 
// Module Name: RAM
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


module RAM(clk,write_data,write_enable,write_addr,read_enable,read_addr,read_data);
input clk;
input write_enable,read_enable;
input  [7:0] write_data;
input [4:0] write_addr,read_addr ;
output reg [7:0] read_data;
reg [7:0]MEM[15:0];
always@(posedge clk)
begin
if(write_enable)
begin
MEM[write_addr]<=write_data;
end
end

always@(posedge clk)
begin
if(read_enable)
begin
read_data=MEM[read_addr];
end
end
endmodule