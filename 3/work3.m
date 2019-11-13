clc;
clear;

b = [1,0,0];
a = [1,-3/4,1/8];
[H,w] = freqz(b,a,400,'whole');
Hm = abs(H);
Hp = angle(H);

subplot(211);
plot(w,Hm);
title('离散系统的幅频特性曲线');
xlabel('omega(rad/s)');
ylabel('Magnitude');
grid on;

subplot(212);
plot(w,Hp)
title('离散系统的相频特性曲线');
xlabel('omega(rad/s)');
ylabel('Phase');
grid on;

