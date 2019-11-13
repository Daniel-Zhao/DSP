clc;
clear;

a = [3,-4,2];
b = [1,2];
%impz(b,a,30);
n = 0:30;
x = (n == 0);
y = filter(b,a,x);
stem(n,y,'fill');
grid on;

