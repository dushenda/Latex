clear;clc;
k=0;a=1;
f = @(x,y) cos(x*a)+cos(y*a)-k;
fimplicit(f);
hold on
plot([-5,5],[0,0],'k');
hold on
plot([0,0],[-5,5],'k');
xlim([-4,4]);ylim([-4,4]);