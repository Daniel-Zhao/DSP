clc;
clear;

b1 = [0,2,-1.6,-0.9];
a1 = [1,-2.5,1.96,-0.48];
r1 = roots(a1);
[R1,P1,K1] = tf2zp(b1,a1);
mo1 = abs(r1)

b2 = [0,0,0,1,-1];
a2 = [1,-0.9,-0.65,0.873,0];
r2 = roots(a2);
[R2,P2,K2] = tf2zp(b2,a2);
mo2 = abs(r2)

subplot(121);
zplane(b1,a1);
title('零极点分布图');
legend('零点','极点','系统不稳定');
grid on;

subplot(122);
zplane(b2,a2);
title('零极点分布图');
legend('零点','极点','系统稳定');
grid on;

