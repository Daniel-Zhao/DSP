clc;
clear;

%绘制x1(n)
N1 = 8;
n1 = 0:3;
x1 = [1,1,1,1];
X1 = fft(x1,N1);
subplot(3,1,1);
stem(n1,x1);
title('x1(n)的波形');
grid on;
subplot(3,1,2);
Xm1 = abs(X1);
k1 = 0:N1-1;
plot(k1,Xm1);
title('x1(n)8点FFT幅频');
grid on;
subplot(3,1,3);
Xp1 = angle(X1);
plot(k1,Xp1);
title('x1(n)8点FFT相频');
grid on;