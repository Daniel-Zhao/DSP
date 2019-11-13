clc;
clear;

%绘制x5(n)周期16
N5 = 8;
n5 = 0:N5-1;
x5 = sin(pi/8*n5);
X5 = fft(x5,N5);
subplot(3,1,1);
stem(0:length(x5)-1,x5,'.');
title('x5(n)的波形');
grid on;
subplot(3,1,2);
stem(0:N5-1,abs(X5));
title('x5(n)8点FFT幅频');
grid on;
subplot(3,1,3);
stem(0:N5-1,angle(X5),'.');
title('x5(n)8点FFT相频');
grid on;