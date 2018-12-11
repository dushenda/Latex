clear;clc;
t=linspace(0,12*pi,500);
x=cos(t);
y=cos(t).*sin(t);
z=t.^2;
plot3(x,y,z);
xlabel('cos t');ylabel('cos t*sin t');zlabel('t^2');
grid on