%ָ����ʾ������
clc;
clear;

wp = 0.3*pi;
ws = 0.45*pi;
deltaw = ws-wp;%���ɴ�
N0 = ceil(6.6*pi/deltaw);%����������
N = N0+mod(N0+1,2)   %N0+1��2ȡģ����֤NΪ����
windows = (hamming(N))';%����ת��
wc = (ws+wp)/2;%��ֹƵ��
hd = ideal_lp(wc,N);
b = hd.*windows;%b��h��n��
[H,w] = freqz(b,1,1000,'whole');%��0��2piȡ1000���㣬��Ƶ��
H = (H(1:501))';%ȡ0��pi��ֵ
w = (w(1:501))';
mag = abs(H);
db = 20*log10((mag+eps)/max(mag));
pha = angle(H);
n = 0:N-1;
dw = 2*pi/1000;
Rp = -(min(db(1:wp/dw+1)))%��ͨ����Ȣ��һ����Сֵ
As = -round(max(db(ws/dw+1:501)))%�����Ȣ��һ�����ֵ��round��������ȡ��

subplot(2,2,1);
stem(n,b);
axis([0,N,1.1*min(b),1.1*max(b)]);
title('ʵ��������Ӧ');
xlabel('n');ylabel('h(n)');

subplot(2,2,2);
stem(n,windows);
axis([0,N,0,1.1]);
title('����������');
xlabel('n');
ylabel('wd(n)');

subplot(2,2,3);
plot(w/pi,db);axis([0,1,-80,10]);
title('��Ƶ��Ӧ');
xlabel('Ƶ��(��λ��\pi)');
ylabel('H(e^{j/omega})');
set(gca,'XTickMode','manual','XTick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','YTick',[-50,-20,-3,0]);grid;

subplot(2,2,4);
plot(w/pi,pha);
axis([0,1,-4,4]);
title('��Ƶ��Ӧ');
xlabel('Ƶ��(��λ��\pi)');
ylabel('\phi(\omega)');
set(gca,'XTickMode','manual','XTick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','YTick',[-3.1416,0,3.1416,4]);grid;











