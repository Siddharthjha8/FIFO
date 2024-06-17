`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 14:19:08
// Design Name: 
// Module Name: Gray counter
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


module write_gray_counter(write_enable,wfull,wqr,rst,clk,bin,gry);
input write_enable,rst,clk;
input [4:0]wqr;
output reg wfull;
output [3:0]bin;
output reg [4:0]gry;

reg [4:0]wbin;
wire [4:0]wgraynext,wbinnext;
wire [4:0]wfull_val;
always@(posedge clk or posedge rst)
begin
if(rst)
{wbin,gry}<=0;
else
{wbin,gry}<={wbinnext,wgraynext};
end

assign bin = wbin[3:0];
assign wbinnext= wbin+(write_enable&~wfull);
assign wgraynext = (wbinnext>>1)^wbinnext;

assign wfull_val=(wgraynext=={~wqr[4],wqr[3:0]});

always@(posedge clk or posedge rst)
begin
if(rst)
wfull<=1'b0;
else
wfull<=wfull_val;
end
endmodule
