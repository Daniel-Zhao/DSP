function hd=ideal_lp(wc,M)
% �����ͨ�˲����ĵ�λ������Ӧ����ֹƵ�ʺͳ���
alpha = (M-1)/2;
n=0:1:M-1;
m=n-alpha+eps;
hd=sin(wc*m)./(pi*m);
