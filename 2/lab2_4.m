clc;
clear;

nx = -1 : 5;                   %�����ź�
nh = -2 : 10;                  %ϵͳ
x = uDT(nx) - uDT(nx-4);
h = 0.8.^nh.*(uDT(nh)-uDT(nh-8));
y = conv(x,h);                 %������

ny1 = nx(1)+nh(1);
ny2 = nx(end)+nh(end);
ny = ny1 : ny2;
stem(ny,y,'fill');
grid on;
