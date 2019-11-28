function [xt,t]=xtg(N)
%clc;clear all;close all;
%实验五信号x(t)产生信号，并显示信号的幅频特性曲线
%xt=xtg产生一个长度为N，有加性高频噪声的单频调幅信号xt，采样频率是1000Hz
%载波频率为fc=Fs/10=100Hz，调制信号（正弦信号）频率为f0=fc/10=10Hz
%N=2000;            %取2000个样点
Fs=1000;            %采样频率
T=1/Fs;             %采样周期，采样间隔
Tp=N*T;             %信号持续时间
t=0:T:(N-1)*T;
fc=Fs/10;           %载波频率100
f0=fc/10;           %基带信号频率10
mt=cos(2*pi*f0*t);  %单频基带信号
ct=cos(2*pi*fc*t);  %载波信号
xt=mt.*ct;          %调制，采样
nt=2*rand(1,N)-1;   %产生随机噪声

%====设计高通滤波器hn，用于滤除噪声nt中的低频成分，生成高通噪声===
fp=150;fs=200;rp=0.1;As=70;     %滤波器指标，依次是截止频率，最大衰减，最小衰减！
fb=[fp,fs];                                     %过渡带
m=[0,1];                                       %高通滤波器，[1 0]为低通滤波器！
dev=[10^(-As/20),(10^(rp/20)-1)/(10^(rp/20)+1)];    %衰减系数
[n,fo,mo,w] = firpmord([150 200],[0 1],dev,1000 );
hn = firpm(n,fo,mo,w);                  %设计的高通滤波器的单位脉冲响应！
yt=filter(hn,1,10*nt);                       %滤除高斯白噪声的低频成分！生成高通干扰
%===============================================
xt=xt+yt;
fst=fft(xt,N);
k=0:N-1;
%f=k/Tp;
subplot(311);
plot(t,xt);
grid on;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);title('信号加噪声波形');
subplot(312);plot(k,abs(fst)/max(abs(fst)));
grid on; title('信号加噪声的频谱');
axis([0,Fs/2,0,1.2]);xlabel('f/Hz');ylabel('幅度');
subplot(313);plot(k,abs(fst)/max(abs(fst)));
grid on; title('信号加噪声的频谱');
axis([N/Fs*100-50,N/Fs*100+50,0,1.2]);xlabel('f/Hz');ylabel('幅度');

