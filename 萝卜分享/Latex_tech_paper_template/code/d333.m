clear;clc;
t=linspace(0,6*pi,30);
x=10*sin(t);
y=10*cos(t);
z=t;
u=gradient(x);
v=gradient(y);
w=gradient(z);
quiver3(x,y,z,u,v,w);
hold on
t=linspace(0,6*pi,3000);
x=10*sin(t);
y=10*cos(t);
z=t;
plot3(x,y,z);
box off