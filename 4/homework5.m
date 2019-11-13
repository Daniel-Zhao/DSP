clc;
clear;

%����x5(n)����16
N5 = 8;
n5 = 0:N5-1;
x5 = sin(pi/8*n5);
X5 = fft(x5,N5);
subplot(3,1,1);
stem(0:length(x5)-1,x5,'.');
title('x5(n)�Ĳ���');
grid on;
subplot(3,1,2);
stem(0:N5-1,abs(X5));
title('x5(n)8��FFT��Ƶ');
grid on;
subplot(3,1,3);
stem(0:N5-1,angle(X5),'.');
title('x5(n)8��FFT��Ƶ');
grid on;