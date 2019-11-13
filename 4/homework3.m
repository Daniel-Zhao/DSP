%绘制x3(n) 
clc;
clear;

N3 = 16;
x3 = [4:-1:1 1:1:4];
X3 = fft(x3,N3);
subplot(3,1,1);
stem(0:length(x3)-1,x3);
title('x3(n)的波形');
grid on;
subplot(3,1,2);
plot(0:N3-1,abs(X3));
title('x3(n)16点FFT幅频');
grid on;
subplot(3,1,3);
plot(0:N3-1,angle(X3));
title('x3(n)16点FFT相频');
grid on;