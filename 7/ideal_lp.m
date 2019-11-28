function hd=ideal_lp(wc,M)
% 理想低通滤波器的单位脉冲响应，截止频率和长度
alpha = (M-1)/2;
n=0:1:M-1;
m=n-alpha+eps;
hd=sin(wc*m)./(pi*m);
