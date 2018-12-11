clear;clc;
x=linspace(0,2*pi,18);
x=x';
y1=10*sin(x);
y2=1.2*y1;
y=[y1,y2];
barh(x,y);
hold on
plot(y,x,'o-');
axis([-12,12,0,7]);
box off