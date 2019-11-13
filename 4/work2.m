%ÀºøºÃ‚
clc;
clear;

n = 0:9;
x = uDT(n);
N = 100;
subplot(2,1,1);
stem(n,x);
grid on;
ylim([0 1.5]);
title('R10(n)');

subplot(2,1,2);
X = fft(x,N);
plot(-4*pi:2*pi/N:-2*pi-(2*pi/N),abs(X));
grid on;
hold on;
plot(-2*pi:2*pi/N:0-(2*pi/N),abs(X));
grid on;
hold on;
plot(0:2*pi/N:2*pi-(2*pi/N),abs(X));
grid on;
hold on;
plot(2*pi:2*pi/N:4*pi-(2*pi/N),abs(X));
grid on;
hold on;
% x2 = -4*pi:2*pi/N:4*pi-(2*pi/N);
% x2 = [-4*pi:2*pi/N:-2*pi-(2*pi/N),-2*pi:2*pi/N:0-(2*pi/N),0:2*pi/N:2*pi-(2*pi/N),2*pi:2*pi/N:4*pi-(2*pi/N)];
% plot(-4*pi:2*pi/N:4*pi-(2*pi/N),abs(X));
axis([-4*pi 4*pi 0 15]);
title('|FT[X(n)]|');


