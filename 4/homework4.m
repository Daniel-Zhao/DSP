clc;
clear;

%绘制x4(n)周期8
N4 = 16;
n4 = 0:N4-1;
x4 = cos(pi/4*n4);
X4 = fft(x4,N4);
subplot(3,1,1);
stem(0:length(x4)-1,x4,'.');
title('x4(n)的波形');
grid on;
subplot(3,1,2);
stem(0:N4-1,abs(X4),'.');
title('x4(n)16点FFT幅频');
grid on;
subplot(3,1,3);
stem(0:N4-1,angle(X4),'.');
title('x4(n)16点FFT相频');
grid on;