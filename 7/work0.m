%指导书示例程序
clc;
clear;

wp = 0.3*pi;
ws = 0.45*pi;
deltaw = ws-wp;%过渡带
N0 = ceil(6.6*pi/deltaw);%窗函数长度
N = N0+mod(N0+1,2)   %N0+1对2取模，保证N为奇数
windows = (hamming(N))';%矩阵转置
wc = (ws+wp)/2;%截止频率
hd = ideal_lp(wc,N);
b = hd.*windows;%b即h（n）
[H,w] = freqz(b,1,1000,'whole');%在0到2pi取1000个点，求频响
H = (H(1:501))';%取0到pi的值
w = (w(1:501))';
mag = abs(H);
db = 20*log10((mag+eps)/max(mag));
pha = angle(H);
n = 0:N-1;
dw = 2*pi/1000;
Rp = -(min(db(1:wp/dw+1)))%在通带里娶了一个最小值
As = -round(max(db(ws/dw+1:501)))%阻带里娶了一个最大值，round四舍五入取整

subplot(2,2,1);
stem(n,b);
axis([0,N,1.1*min(b),1.1*max(b)]);
title('实际脉冲响应');
xlabel('n');ylabel('h(n)');

subplot(2,2,2);
stem(n,windows);
axis([0,N,0,1.1]);
title('窗函数特性');
xlabel('n');
ylabel('wd(n)');

subplot(2,2,3);
plot(w/pi,db);axis([0,1,-80,10]);
title('幅频响应');
xlabel('频率(单位：\pi)');
ylabel('H(e^{j/omega})');
set(gca,'XTickMode','manual','XTick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','YTick',[-50,-20,-3,0]);grid;

subplot(2,2,4);
plot(w/pi,pha);
axis([0,1,-4,4]);
title('相频响应');
xlabel('频率(单位：\pi)');
ylabel('\phi(\omega)');
set(gca,'XTickMode','manual','XTick',[0,wp/pi,ws/pi,1]);
set(gca,'YTickMode','manual','YTick',[-3.1416,0,3.1416,4]);grid;











