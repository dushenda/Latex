clear;clc;
x=linspace(0,8*pi,3600);
y=exp(-0.1*x).*sin(x);
comet(x,y);