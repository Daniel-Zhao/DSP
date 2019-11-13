clc;
clear;

nx = -3 : 3;
nh = -1 : 4;
x = [3,11,7,0,-1,4,2];
h = [2,3,0,-5,2,1];

ny1 = nx(1)+nh(1);
ny2 = nx(end)+nh(end);
ny = ny1 : ny2;
y = conv(x,h);

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

subplot(3,1,3);
stem(ny,y,'--','diamondr',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','green');
xlabel('n');
title('y(n)');
axis([-4 8 -30 50]);
grid on;
 
 