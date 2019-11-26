%%
%example first
wp = 0.25*pi;
ws = 0.4*pi;
Rp = 1; As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);

Fs = 2000; T = 1/Fs; Omgp = wp*Fs; Omgs = ws*Fs;

[n,Omgc] = buttord(Omgp,Omgs,Rp,As,'s')
[z0,p0,k0] = buttap(n);
ba1 = k0 * real(poly(z0));
aa1 = real(poly(p0));
[ba,aa] = lp2lp(ba1,aa1,Omgc);
[bd,ad] = impinvar(ba,aa,Fs)
[H,w] = freqz(bd,ad);
dbH = 20*log10((abs(H)+eps)/max(abs(H)));
subplot(2,2,1);
plot(w/pi,abs(H));
ylabel('|H|');title('幅度响应');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
subplot(2,2,3);plot(w/pi,dbH);title('幅度响应（dB）');
ylabel('dB');xlabel('频率（\pi）');axis([0,1,-40,5]);
set(gca','XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
subplot(2,2,4);
zplane(bd,ad);axis([-1.1,1.1,-1.1,1.1]);title('零极点图');

%%
%example second
wp = 0.25*pi;
ws = 0.4*pi;
Rp = 1; As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);

Fs = 100; T = 1/Fs; 
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
ylabel('|H|');title('幅度响应');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
subplot(2,2,3);plot(w/pi,dbH);title('幅度响应（dB）');
ylabel('dB');xlabel('频率（\pi）');axis([0,1,-40,5]);
set(gca','XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
subplot(2,2,4);
zplane(bd,ad);axis([-1.1,1.1,-1.1,1.1]);title('零极点图');


%%
%test first
wp = 0.2*pi;
ws = 0.35*pi;
Rp = 1; As = 15;
ripple = 10^(-Rp/20);
Attn = 10^(-As/20);

Fs = 10; T = 1/Fs; Omgp = wp*Fs; Omgs = ws*Fs;

[n,Omgc] = buttord(Omgp,Omgs,Rp,As,'s')
[z0,p0,k0] = buttap(n);
ba1 = k0 * real(poly(z0));
aa1 = real(poly(p0));
[ba,aa] = lp2lp(ba1,aa1,Omgc);

[bd,ad] = impinvar(ba,aa,Fs)
[H,w] = freqz(bd,ad);
dbH = 20*log10((abs(H)+eps)/max(abs(H)));
subplot(2,2,1);
plot(w/pi,abs(H));
ylabel('|H|');title('幅度响应');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
subplot(2,2,3);plot(w/pi,dbH);title('幅度响应（dB）');
ylabel('dB');xlabel('频率（\pi）');axis([0,1,-40,5]);
set(gca','XTickMode','manual','XTick',[0,0.25,0.4,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
subplot(2,2,4);
zplane(bd,ad);axis([-1.1,1.1,-1.1,1.1]);title('零极点图');


%%
%test second_1
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
ylabel('|H|');title('幅度响应');axis([0,1,0,1.1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.35,1]);
set(gca,'YTickMode','manual','YTick',[0,Attn,ripple,1]);grid
subplot(2,2,2);plot(w/pi,angle(H)/pi);
ylabel('\phi');title('相位响应');axis([0,1,-1,1]);
set(gca,'XTickMode','manual','XTick',[0,0.25,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-1,0,1]);grid
subplot(2,2,3);plot(w/pi,dbH);title('幅度响应（dB）');
ylabel('dB');xlabel('频率（\pi）');axis([0,1,-40,5]);
set(gca','XTickMode','manual','XTick',[0,0.25,0.35,1]);
set(gca,'YTickMode','manual','YTick',[-50,-15,-1,0]);grid
subplot(2,2,4);
zplane(bd,ad);axis([-1.1,1.1,-1.1,1.1]);title('零极点图');

%%
%test second_2
xn = [-4,-2,0,-4,-6,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12,10,6,6,6,4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0];
B = [0.0092    0.0367    0.0550    0.0367    0.0092];
A = [1.0000   -2.0325    1.8204   -0.7706    0.1294];
yn = filter(B,A,xn);
figure;
subplot(2,2,1);
stem(0:length(xn)-1,xn,'*');title('滤波前');
subplot(2,2,2);
stem(0:length(yn)-1,yn,'*');title('滤波后');

x=fft(xn,1024);
y=fft(yn,1024);
N=0:1023;
wk=2*N/1024;
subplot(2,2,3);
plot(wk,abs(x));
subplot(2,2,4);
plot(wk,abs(y));

