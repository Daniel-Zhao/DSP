clc;
clear;

t = -1:0.001:1;
x = sin(7*pi*t);
subplot(3,1,1);
plot(t,x);

fd1 = 70;          %采样频率
n = 20;            %采样点数
td1 = -1:1/fd1:1;
y1 = sin(7*pi*td1);
subplot(3,1,2);
stem(td1,y1);

fd2 = 140;          %采样频率
n = 20;             %采样点数
td2 = -1:1/fd2:1;
y2 = sin(7*pi*td2);
subplot(3,1,3);
stem(td2,y2);
