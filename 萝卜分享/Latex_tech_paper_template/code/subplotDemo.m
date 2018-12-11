clear;clc;
x1=0:0.01:4*pi;
subplot(2,2,1)
y1=sin(x1);
plot(x1,y1);
xlabel('x');ylabel('y');title('(1)');
subplot(2,2,2)
x2=linspace(1,100,100);
y2=x2.^2-2*x2+sqrt(x2)-x2.^(1/3)-10*x2.^(1.5);
plot(x2,y2,'k');
xlabel('x');ylabel('y');title('(2)');
subplot(2,2,3)
peaks(8);title('(3)');
subplot(2,2,4)
x4=linspace(0,7,90);
a1=2*exp(-0.2*x4);
b1=sin(8*x4);
y41=a1.*b1;
a2=3*exp(-0.3*x4);
b2=sin(4*x4);
y42=5+a2.*b2;
plot(x4,y41,'--',x4,y42,':');title('(4)');