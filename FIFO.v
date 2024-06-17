`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 20:07:30
// Design Name: 
// Module Name: FIFO
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


module FIFO(wdata,rdata,wfull,rempty,rclk,wclk,wrst,rrst,write_enable,read_enable);
input rclk,wclk,wrst,rrst,write_enable,read_enable;
input [7:0] wdata; 
output [7:0] rdata;
output wfull,rempty;
wire [3:0] waddr,raddr;
wire [4:0] wptr,rptr,wq2_rptr,rq2_wptr;
wire wclken,rclken;

assign wclken=write_enable&(~wfull);
assign rclken=read_enable&(~rempty);

RAM m1(.clk(wclk),.write_data(wdata),.write_enable(wclken),.write_addr(waddr),.read_enable(rclken),.read_addr(raddr),.read_data(rdata));

write_gray_counter w1(.write_enable(write_enable),.wfull(wfull),.wqr(wq2_rptr),.rst(wrst),.clk(wclk),.bin(waddr),.gry(wptr));

read_gray_counter r1(.read_enable(read_enable),.rempty(rempty),.rqr(rq2_wptr),.rst(rrst),.clk(rclk),.bin(raddr),.gry(rptr));

synchronizer s1(.clk(wclk),.reset(wrst),.in(rptr),.out(wq2_rptr));

synchronizer s2(.clk(rclk),.reset(rrst),.in(wptr),.out(rq2_wptr));
endmodule
