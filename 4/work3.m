%»æÖÆx4(n)ÖÜÆÚ8
clc;
clear;

N4 = 8;
n4 = 0:N4-1;
x4 = cos(pi/4*n4);
X4 = fft(x4,N4);
subplot(3,1,1);
stem(0:length(x4)-1,x4,'.');
%grid on;
subplot(3,1,2);
stem(0:N4-1,abs(X4),'.');
%grid on;
subplot(3,1,3);
stem(0:N4-1,angle(X4),'.');
%grid on;

