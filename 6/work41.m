%脉冲响应不变心率
%脉冲不变法设计IIR数字低通滤波器
clc;
clear;

% wp = 0.2*pi;
% ws = 0.35*pi;
% Rp = 1; As = 15;
% ripple = 10^(-Rp/20);
% Attn = 10^(-As/20);
% 
% Fs = 10; T = 1/Fs; Omgp = wp*Fs; Omgs = ws*Fs;
% 
% [n,Omgc] = buttord(Omgp,Omgs,Rp,As,'s')
% [z0,p0,k0] = buttap(n);
% ba1 = k0 * real(poly(z0));
% aa1 = real(poly(p0));
% [ba,aa] = lp2lp(ba1,aa1,Omgc);
% [bd1,ad1] = impinvar(ba,aa,Fs)
% [H,w] = freqz(bd1,ad1);
% dbH = 20*log10((abs(H)+eps)/max(abs(H)));
% subplot(2,2,1);
% plot(w/pi,abs(H));
% ylabel('|H|');title('幅度响应');axis([0,1,0,1.1]);
% set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
% set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
% subplot(2,2,2);plot(w/pi,angle(H)/pi);
% ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
% set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
% set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
% subplot(2,2,3);plot(w/pi,dbH);title('幅度响应（dB）');
% ylabel('dB');xlabel('频率（\pi）');axis([0,1,-40,5]);
% set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
% set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
% subplot(2,2,4);
% zplane(bd1,ad1);axis([-1.1,1.1,-1.1,1.1]);title('零极点图');

xn = [-4,-2,0,-4,-6,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,...
    0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12,10,6,...
    6,6,4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0];

B = [0 0.0000    0.0071    0.0457    0.0277    0.0016];
A = [1.0000   -2.5686    2.9696   -1.8328    0.5937   -0.0799];
% yn = filter(bd1,ad1,xn);
yn = filter(B,A,xn);
figure;
subplot(2,2,1);
stem(0:length(xn)-1,xn,'.');grid;
axis([0,60,-100,20]);
title('滤波前');
subplot(2,2,2);
stem(0:length(yn)-1,yn,'.');grid;
axis([0,60,-100,20]);
title('滤波后');

%搞频响
x=fft(xn,1024);
y=fft(yn,1024);
N=0:1023;
wk=2*N/1024;
subplot(2,2,3);
plot(wk,abs(x));
xlabel('ω/Π');
subplot(2,2,4);
plot(wk,abs(y));
xlabel('ω/Π');
