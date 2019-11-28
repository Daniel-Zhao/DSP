%�����źŴ���ʵ��7 ���� Ϊʲô�����˲���������ģ���ź�
clc;
clear;

%2:ѡ����ʵĴ��������FIR���ֵ�ͨ�˲��������˥��60db
wp=0.24*pi;
ws=0.3*pi;
deltaw=ws-wp;
N0=ceil(11*pi/deltaw);
N=N0+mod(N0+1,2)
windows=(blackman(N))';
wc=(ws+wp)/2;
hd=ideal_lp(wc,N);
b=hd.*windows;
[H,w]=freqz(b,1,1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
pha=angle(H);
n=0:N-1;
dw=2*pi/1000;
Rp = -(min(db(1:wp/dw+1)))
As=-round(max(db(ws/dw+1:501)))
figure;
subplot(2,2,1);
stem(n,b);
axis([0,N,1.1*min(b),1.1*max(b)]);
title('ʵ��������Ӧ');
xlabel('n');ylabel('h(n)');
subplot(2,2,2);
stem(n,windows);
axis([0,N,0,1.1]);
title('����������');
xlabel('n');ylabel('wd(n)');
subplot(2,2,3);
plot(w/pi,db);
axis([0,1,-80,10]);
title('��Ƶ��Ӧ');
xlabel('Ƶ��(��λ��\pi)');
ylabel('H(e^{j/omega})');
set(gca,'XTickMode','manual','Xtick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','Ytick',[-50,-20,-3,0]);grid;

subplot(2,2,4);
plot(w/pi,pha);
axis([0,1,-4,4]);
title('��Ƶ��Ӧ');
xlabel('Ƶ��(��λ��\pi)');
ylabel('\phi(\omega)');
set(gca,'XTickMode','manual','Xtick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','Ytick',[-3.1415,0,3.1316,4]);grid
 
%3���ú���xtg�������м����������ź�
figure;
[xt,t]=xtg(1000);
 
%4��2��Ƶ��˲�������3���ź��˲�   ����Ƶ��1000��500��Ƶ��120/500 *pi=0.24*pi 150/500 *pi=0.3*pi
figure;
% wp=0.24*pi;
% ws=0.3*pi;
% deltaw=ws-wp;
% N0=ceil(12*pi/deltaw);
% N=N0+mod(N0+1,2)
% windows=(blackman(N))';
% wc=(ws+wp)/2;
% hd=ideal_lp(wc,N);
% b=hd.*windows;
yt=fftfilt(b,xt);
Hyk=abs(fft(yt));
subplot(2,1,1);
plot(t,yt);
subplot(2,1,2);
stem(Hyk);
axis([80,120,min(Hyk),max(Hyk)]);

