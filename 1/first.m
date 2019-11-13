clc;
clear;

t1 = -10 : 0.01 : 10;
y1 = sin(t1)./t1;

% t2 = -4:0.01:4;
% t21 = -1;
% t22 = 1;
% u1 = stepfun(t2,t21);
% u2 = stepfun(t2,t22);
% y2 = u1 - u2;
% axis([-4,4,-2,2]);

t2 = -7 : 0.01 : 7;
w = 2;
y2 = rectpuls(t2,2);


t3 = 0 : pi/100 : 10*pi;
y31 = 5 * exp(0.5*t3);
y32 = sin(2*pi*t3);
y3 = y31.*y32;

subplot(3,1,1);
plot(t1,y1);
axis([-10 10 -1.5 1.5]);
grid on;
xlabel('时间');
ylabel('y1');
title('连续信号（1）');

subplot(3,1,2);
plot(t2,y2,'r');
axis([-5 5 -3 3]);
grid on;
xlabel('时间');
ylabel('y1');
title('连续信号（2）');

subplot(3,1,3);
plot(t3/pi,y3,'y');
grid on;
xlabel('时间');
ylabel('y1');
title('连续信号（3）');

