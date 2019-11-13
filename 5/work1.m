%数字信号处理-实验5-频域域采样理论论证
clc;
clear;

%序列一共27长
M = 27;
N = 32;
n = 0:M-1;
xa = 1:14; xb = 13:-1:1; xn = [xa,xb];

%32点采样、还原
x32k = fft(xn,32);
x32n = ifft(x32k);
%16点采样、还原,隔一个取一个
x16k = x32k(1:2:N);
x16n = ifft(x16k,N/2);

subplot(3,2,2);
stem(n,xn,'.');
xlabel('n');ylabel('x(n)');title('(b)三角波序列x(n)');
axis([0,32,0,20]);
grid on;

%取2的整次幂
k = 0 : 1023;
wk = 2*k/1024;
X = fft(xn,1024);
subplot(3,2,1);
plot(wk,abs(X));
axis([0 1 0 200]);
xlabel('ω/π');ylabel('|X(e^j^ω)|');title('(a)FT[x(n)]');
grid on;

k = 0:N/2-1;
subplot(3,2,3);
stem(k,abs(x16k),'.');
xlabel('k'); ylabel('|X_1_6(k)|'); title('(c)16点频域采样');
axis([0,8,0,200]);
grid on;

subplot(3,2,4);
stem(k,x16n,'.');
xlabel('n'); ylabel('|X_1_6(n)|');title('(d)16点IDFT[X_1_6(k)]');
axis([0,32,0,20]);
grid on;

k = 0:N-1;
subplot(3,2,5);
stem(k,abs(x32k),'.');
xlabel('k'); ylabel('|X_3_2(k)|');title('(e)32点频域采样');
axis([0,16,0,200]);
grid on;
subplot(3,2,6);
stem(k,x32n,'.');
xlabel('n'); ylabel('|X_3_2(k)|');title('(f)32点IDFT[X_3_2(k)]');
axis([0,32,0,20]);
grid on;
