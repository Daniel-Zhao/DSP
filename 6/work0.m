%���岻�䷨���IIR���ֵ�ͨ�˲���
clc;
clear;

wp = 0.25*pi;
ws = 0.4*pi;
Rp = 1;
As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);
Fs = 2000;
T = 1/Fs;
Omgp = wp*Fs;
Omgs = ws*Fs;
[n,Omgc] = buttord(Omgp,Omgs,Rp,As,'s')
[z0,p0,k0] = buttap(n);
ba1 = k0*real(poly(z0));
aa1 = real(poly(p0));
[ba,aa] = lp2lp(ba1,aa1,Omgc);

%���岻�䷨���������˲���ϵ��
[bd,ad] = impinvar(ba,aa,Fs)
[H,w] = freqz(bd,ad);
dbH = 20*log10((abs(H)+eps)/max(abs(H)));
subplot(2,2,1);
plot(w/pi,abs(H));
ylabel('|H|');
title('��λ��Ӧ');
axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);
grid on;

subplot(2,2,2);
plot(w/pi,angle(H)/pi);
ylabel('\phi');
title('��λ��Ӧ');
axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);
grid on;

subplot(2,2,3);
plot(w/pi,dbH);
title('������Ӧ(dB)');
ylabel('dB');
xlabel('Ƶ��(\pi)');
axis([0,1,-40,5]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);
grid on;
subplot(2,2,4);
zplane(ba,ad);
axis([-1.1,1.1,-1.1,1.1]);
title('�㼫��ͼ');
 
 
 
 
 

 
 