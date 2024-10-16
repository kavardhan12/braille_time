`timescale 1ns / 1ps
module braille_time_tb();
reg clk,rst;
wire [5:0] h_l, h_r, m_l, m_r , s_l, s_r;
//wire [5:0] sec;
braille_time dut(clk, rst, h_l, h_r, m_l, m_r, s_l, s_r);
localparam CLOCK_PERIOD = 1000000000;
integer i;
initial 
begin
rst = 1'b1;
#5 rst = 1'b0; 
end
always
begin
clk = 1'b0;
#(CLOCK_PERIOD / 2);
clk = 1'b1;
#(CLOCK_PERIOD / 2);
end
initial 
begin
clk = 0;
for (i=0;i<86400;i = i+1)
begin
#1000000000;
end
$finish;
end
endmodule
