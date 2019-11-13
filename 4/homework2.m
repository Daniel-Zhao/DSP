clc;
clear;

%绘制x2(n)
N2 = 16;
x2 = [1:4 4:1];
X2 = fft(x2,N2);
subplot(3,1,1);
stem(0:length(x2)-1,x2,'.');
title('x2(n)的波形');
grid on;
subplot(3,1,2);
plot(0:N2-1,abs(X2));
title('x2(n)16点FFT幅频');
grid on;
subplot(3,1,3);
plot(0:N2-1,angle(X2));
title('x2(n)16点FFT相频');
grid on;