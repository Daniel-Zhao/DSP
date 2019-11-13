clc;
clear;

nx = -1 : 5;                   %激励信号
nh = -2 : 10;                  %系统
x = uDT(nx) - uDT(nx-4);
h = 0.8.^nh.*(uDT(nh)-uDT(nh-8));
y = conv(x,h);                 %计算卷积

ny1 = nx(1)+nh(1);
ny2 = nx(end)+nh(end);
ny = ny1 : ny2;
stem(ny,y,'fill');
grid on;
