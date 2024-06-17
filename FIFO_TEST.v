`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 22:09:23
// Design Name: 
// Module Name: FIFO_TEST
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


module FIFO_TEST;
 
reg wr_clk,rd_clk;
reg[7:0] data_in;
wire[7:0] data_out;
wire rd_empty,wr_full;
reg reset_w;
reg reset_r;
reg write_enable,read_enable;
FIFO top_1(.wdata(data_in),
 .rdata(data_out),
 .wclk(wr_clk),
 .rclk(rd_clk),
 .wrst(reset_w),
 .rrst(reset_r),
 .write_enable(write_enable) , 
 .read_enable(read_enable),
 
 .rempty(rd_empty), 
 .wfull(wr_full)); 
initial
begin
 #0data_in=8'h0;
 #50 data_in=8'b00000001; // DATA WHICH IS SUPPLIED
 #80 data_in=8'h2;
 #70 data_in=8'h3;
 #79 data_in=8'h4;
 #80 data_in=8'h5;
 #40 data_in=8'h6;
 #60 data_in=8'h7;
 #50 data_in=8'h8;
 #50 data_in=8'h9;
 #20 data_in=8'h10;
 #70 data_in=8'h11;
 #800 data_in=8'h12;
 #19 data_in=8'h13;
 #10 data_in=8'h14;
 #80 data_in=8'h15;
end
 
initial 
begin
 wr_clk=1'b0;
 write_enable=1'b1;
 read_enable=1'b1;
 rd_clk=1'b0;
 end 
 
 initial forever#5 wr_clk=~wr_clk;
 
 initial
 begin
forever
 #10 rd_clk=~rd_clk;
 end
initial
 reset_r=1'b1;
 begin
 initial
 #5 reset_r=1'b0;
 end
initial
 
 reset_w =1'b1;
 initial
 #5 reset_w=1'b0;
initial 
 
 #5 write_enable=1'b1;
 initial 
 # 5 read_enable=1'b1;
 initial
 begin
 #1000 $finish; end
 initial
 begin
 $monitor( "$time data_out,empty ,full= %d %d %d",data_out,rd_empty,wr_full);
end
endmodule
