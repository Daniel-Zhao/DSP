clc;
clear;

t1 = -5:5;
y1 = t1 == 0;
stem(t1,y1,'filled');


t2 = -4:0.5:4;
t21 = -1;
t22 = 1;
u1 = stepfun(t2,t21);
u2 = stepfun(t2,t22);
y2 = u1 - u2;


t3 = 0 : 60;
y31 = 1.1.^t3;
y32 = sin(0.05*pi*t3);
y3 = y31.*y32;

subplot(3,1,1);
stem(t1,y1,'dy');
axis([-5,5,0,2]);
grid on;
xlabel('时间');
ylabel('y1');
title('离散信号（1）');

subplot(3,1,2);
stem(t2,y2,'sr');
axis([-4,4,-2,2]);
grid on;
xlabel('时间');
ylabel('y2');
title('离散信号（2）');

subplot(3,1,3);
stem(t3/pi,y3,'ob');
grid on;
xlabel('时间');
ylabel('y3');
title('离散信号（3）');

