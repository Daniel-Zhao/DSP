clc;
clear;

x1 = [1,1,1,1];
x2 = [1,1,1,1];
y = conv(x1,x2);
n = 0 : 6;
stem(n,y,'fill');
grid on;
