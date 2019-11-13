clc;
clear;

a = [3,-4,2];
b = [1,2];
n = 0:30;
x = (1/2).^n;
y = filter(b,a,x);
stem(n,y,'fill');
grid on;

