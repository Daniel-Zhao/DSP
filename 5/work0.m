%数字信号处理-实验5-时域采样理论论证
clc;
clear;

A = 444.128;
a = 50*sqrt(2)*pi;
w0 = 50*sqrt(2)*pi;
Tp = 64/1000;
F1 = 1000; F2 = 300;  F3 = 200;
T1 = 1/F1; T2 = 1/F2; T3 = 1/F3;
n1 = 0:Tp*F1-1; 
n2 = 0:Tp*F2-1;
n3 = 0:Tp*F3-1;

%将x1，x2，x3表示出来
x1 = A*exp(-a*n1*T1).*sin(w0*n1*T1);
x2 = A*exp(-a*n2*T2).*sin(w0*n2*T2);
x3 = A*exp(-a*n3*T3).*sin(w0*n3*T3);

%进行DFT变换
f1 = fft(x1,length(n1));
f2 = fft(x2,length(n2));
f3 = fft(x3,length(n3));

%画x1，x2，x3
subplot(3,2,1);
stem(n1,x1,'.');
xlabel('n');ylabel('x1(n)');title('(a)Fs=1000Hz');
grid on;
subplot(3,2,3);
stem(n2,x2,'.');
xlabel('n');ylabel('x2(n)');title('(c)Fs=300Hz');
grid on;
subplot(3,2,5);
stem(n3,x3,'.');
xlabel('n');ylabel('x3(n)');title('(e)Fs=200Hz');
grid on;

%画幅频特性
%转赫兹
k1 = 0:length(f1)-1; fk1 = k1/Tp;
k2 = 0:length(f2)-1; fk2 = k2/Tp;
k3 = 0:length(f3)-1; fk3 = k3/Tp;
subplot(3,2,2);
plot(fk1,abs(f1)*T1);
xlabel('f(Hz)');ylabel('幅度');title('(b)T*FT[Xa(nT)],Fs=1000Hz');
grid on;
subplot(3,2,4);
plot(fk2,abs(f2)*T2);
xlabel('f(Hz)');ylabel('幅度');title('(d)T*FT[Xa(nT)],Fs=300Hz');
grid on;
subplot(3,2,6);
plot(fk3,abs(f3)*T3);
xlabel('f(Hz)');ylabel('幅度');title('(f)T*FT[Xa(nT)],Fs=200Hz');
grid on;
