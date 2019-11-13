clc;
clear;

%绘制x1(n)
N1 = 8;
n1 = 0:3;
x1 = [1,1,1,1];
X1 = fft(x1,N1);
subplot(3,1,1);
stem(n1,x1);
grid on;
subplot(3,1,2);
Xm1 = abs(X1);
k1 = 0:N1-1;
plot(k1,Xm1);
grid on;
subplot(3,1,3);
Xp1 = angle(X1);
plot(k1,Xp1);
grid on;
figure;

%绘制x2(n)
N2 = 8;
x2 = [1:4 4:1];
X2 = fft(x2,N2);
subplot(3,1,1);
stem(0:length(x2)-1,x2,'.');
grid on;
title('x3的波形');
subplot(3,1,2);
plot(0:N2-1,abs(X2));
grid on;
subplot(3,1,3);
plot(0:N2-1,angle(X2));
grid on;
figure;

%绘制x3(n) 
N3 = 8;
x3 = [4:-1:1 1:1:4];
X3 = fft(x3,N3);
subplot(3,1,1);
plot(0:length(x3)-1,x3);
grid on;
title('x3的波形');
subplot(3,1,2);
plot(0:N3-1,abs(X3));
grid on;
title('x3的8点FFT');
subplot(3,1,3);
plot(0:N3-1,angle(X3));
grid on;
figure;

%绘制x4(n)周期8
N4 = 8;
n4 = 0:N4-1;
x4 = cos(pi/4*n4);
X4 = fft(x4,N4);
subplot(3,1,1);
stem(0:length(x4)-1,x4,'.');
grid on;
subplot(3,1,2);
stem(0:N4-1,abs(X4),'.');
grid on;
subplot(3,1,3);
stem(0:N4-1,angle(X4),'.');
grid on;
figure;


%绘制x5(n)周期16
N5 = 16;
n5 = 0:N5-1;
x5 = sin(pi/8*n4);
X5 = fft(x5,N5);
subplot(3,1,1);
stem(0:length(x5)-1,x5,'.');
grid on;
subplot(3,1,2);
stem(0:N5-1,abs(X5));
grid on;
subplot(3,1,3);
stem(0:N5-1,angle(X5),'.');
grid on;
figure;

%绘制x6(n)连续信号
fs = 64;
t = 1/fs;

N6 = 64;
n6 = 0:N6-1;
x6 = cos(8*pi*n6*t)+cos(16*pi*n6*t)+cos(20*pi*n6*t);
X6 = fft(x6,N6);
subplot(3,1,1);
stem(0:length(x6)-1,x6,'.');
%plot(0:length(x6)-1,x6);
grid on;
subplot(3,1,2);
stem(0:N6-1,abs(X6),'.');
%plot(0:N6-1,abs(X6));
grid on;
subplot(3,1,3);
stem(0:N6-1,angle(X6),'.');
%plot(0:N6-1,angle(X6));
grid on;
