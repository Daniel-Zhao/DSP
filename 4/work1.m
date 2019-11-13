clc;
clear;
%绘制x6(n)  连续信号
fs = 64;
t = 1/fs;

N61 = 16;
n61 = 0:N61-1;
x61 = cos(8*pi*n61*t)+cos(16*pi*n61*t)+cos(20*pi*n61*t);
X61 = fft(x61,N61);
subplot(3,1,1);
stem(0:length(x61)-1,x61,'.');
title('x6(n)的波形');
grid on;
subplot(3,1,2);
stem(0:N61-1,abs(X61),'.');
title('x6(n)的16点FFT幅频');
grid on;
subplot(3,1,3);
stem(0:N61-1,angle(X61),'.');
title('x6(n)的16点FFT相频');
grid on;
figure;

N62 = 32;
n62 = 0:N62-1;
x62 = cos(8*pi*n62*t)+cos(16*pi*n62*t)+cos(20*pi*n62*t);
X62 = fft(x62,N62);
subplot(3,1,1);
stem(0:length(x62)-1,x62,'.');
title('x6(n)的波形');
grid on;
subplot(3,1,2);
stem(0:N62-1,abs(X62),'.');
title('x6(n)的32点FFT幅频');
grid on;
subplot(3,1,3);
stem(0:N62-1,angle(X62),'.');
title('x6(n)的32点FFT相频');
grid on;
figure;

N6 = 64;
n6 = 0:N6-1;
x6 = cos(8*pi*n6*t)+cos(16*pi*n6*t)+cos(20*pi*n6*t);
X6 = fft(x6,N6);
subplot(3,1,1);
stem(0:length(x6)-1,x6,'.');
title('x6(n)的波形');
grid on;
subplot(3,1,2);
stem(0:N6-1,abs(X6),'.');
title('x6(n)的64点FFT幅频');
grid on;
subplot(3,1,3);
stem(0:N6-1,angle(X6),'.');
title('x6(n)的64点FFT相频');
grid on;

