clc;
clear;

nx = -2 : 6;                   %激励信号
nh = -2 : 12;                  %系统
x = uDT(nx) - uDT(nx-5);
h = (7/8).^nh.*(uDT(nh)-uDT(nh-10));
y = conv(x,h);                 %计算卷积
ny1 = nx(1)+nh(1);
ny2 = nx(end)+nh(end);
ny = ny1 : ny2;

subplot(3,1,1);
stem(nx,x,'fill');
xlabel('n');
title('x(n)');
grid on;

subplot(3,1,2);
stem(nh,h,'fill');
xlabel('n');
title('h(n)');
grid on;

subplot(3,1,3)
stem(ny,y,'--','diamondr',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','green');
xlabel('n');
title('y(n)');
grid on;
