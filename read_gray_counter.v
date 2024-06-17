`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:03:18
// Design Name: 
// Module Name: read_gray_counter
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


module read_gray_counter(read_enable,rempty,rqr,rst,clk,bin,gry);

input read_enable,rst,clk;
input [4:0]rqr;
output reg rempty;
output [3:0]bin;
output reg [4:0]gry;

reg [4:0]rbin;
wire [4:0]rgraynext,rbinnext;
wire [4:0]rempty_val;
always@(posedge clk or posedge rst)
begin
if(rst)
{rbin,gry}<=0;
else
{rbin,gry}<={rbinnext,rgraynext};
end

assign bin = rbin[3:0];
assign rbinnext= rbin+(read_enable&~rempty);
assign rgraynext = (rbinnext>>1)^rbinnext;

assign rempty_val=(rgraynext==rqr[4:0]);

always@(posedge clk or posedge rst)
begin
if(rst)
rempty<=1'b1;
else
rempty<=rempty_val;
end
endmodule

