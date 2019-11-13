clc;
clear;

y1 = [3,4,1];
y2 = [5/2,6,10];
x1 = [1,1];
x2 = [1];

subplot(2,1,1);
impz(x1,y1,50);
legend('Œ»∂®');
grid on;

subplot(2,1,2);
impz(x2,y2,50);
legend('≤ªŒ»∂®');
grid on;

