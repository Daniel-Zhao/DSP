%˫���Ա任
clc;
clear;

wp = 0.2*pi;
ws = 0.35*pi;
Rp = 1; As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);

Fs = 10; T = 1/Fs; 
Omgp = (2/T)*tan(wp/2); 
Omgs = (2/T)*tan(ws/2);

[n,Omgc] = buttord(Omgp,Omgs,Rp,As,'s')
[z0,p0,k0] = buttap(n);
ba1 = k0 * real(poly(z0));
aa1 = real(poly(p0));
[ba,aa] = lp2lp(ba1,aa1,Omgc);

[bd,ad] = bilinear(ba,aa,Fs)
[H,w] = freqz(bd,ad);
dbH = 20*log10((abs(H)+eps)/max(abs(H)));
subplot(2,2,1);
plot(w/pi,abs(H));
ylabel('|H|');title('������Ӧ');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('��λ��Ӧ');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
subplot(2,2,3);plot(w/pi,dbH);title('������Ӧ��dB��');
ylabel('dB');xlabel('Ƶ�ʣ�\pi��');axis([0,1,-40,5]);
set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
subplot(2,2,4);
zplane(bd,ad);axis([-1.1,1.1,-1.1,1.1]);title('�㼫��ͼ');

