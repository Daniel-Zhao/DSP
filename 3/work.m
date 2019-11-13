clc;
clear;

% B = [18];
% A = [18, 3,-4,1];
% [R,P,K] = residuez(B,A);

% B = [1,0.32];
% A = [1,1,0.16];
% [R,P,K] = tf2zp(B,A);
% zplane(B,A);

% b1 = [1,0];
% a1 = [1,-0.8];
% subplot(121);
% zplane(b1,a1);
% subplot(122);
% impz(b1,a1,30);
% grid on;


%3.2.4
% b = [1,-0.96,0.9028];
% a = [1,-1.56,0.8109];
% [H,w] = freqz(b,a,400,'whole');
% Hm = abs(H);
% Hp = angle(H);
% 
% subplot(211);
% plot(w,Hm);
% grid on;
% 
% subplot(212);
% plot(w,Hp);
% grid on;

%(1)
b1 = [1,0];
a1 = [1,-0.8];
subplot(121);
zplane(b1,a1);
subplot(122);
impz(b1,a1,30);
grid on;
figure;

%(2)
b2 = [0,1,0];
a2 = [1,0.8];
subplot(121);
zplane(b2,a2);
subplot(122);
impz(b2,a2,30);
grid on;
figure;

%(3)
b3 = [0,1,0];
a3 = [1,-1.2,0.72];
subplot(121);
zplane(b3,a3);
subplot(122);
impz(b3,a3,30);
grid on;
figure;

%(4)
b4 = [1,0];
a4 = [1,-1];
subplot(121);
zplane(b4,a4);
subplot(122);
impz(b4,a4,30);
grid on;
figure;

%(5)
b5 = [0,1,0];
a5 = [1,-0.6,1];
subplot(121);
zplane(b5,a5);
subplot(122);
impz(b5,a5,30);
grid on;
figure;

%(6)
b6 = [1,0];
a6= [1,-1.2];
subplot(121);
zplane(b6,a6);
subplot(122);
impz(b6,a6,30);
grid on;
figure;

%(7)
b7 = [0,1,0];
a7 = [1,-2,1.36];
subplot(121);
zplane(b7,a7);
subplot(122);
impz(b7,a7,30);
grid on;
