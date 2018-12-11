clear;clc;
x=[1e1,1e2,1e3,1e4,1e5,1e6,1e7,1e8,1e9];
y1=x.^2+2*x+4;
y2=x.^3+3*x+5;
subplot(2,2,[1,3])
loglog(x,y1,x,y2,'k:');
texy1=texlabel('y_1=x^2+2x+4');texy2=texlabel('y_2=x^3+3*x+5');
legend(texy1,texy2);
axis([1,1e10,1,1e30]);
box off
subplot(2,2,2)
semilogy(x,y1,x,y2,'k:');
subplot(2,2,4)
semilogx(x,y1,'r',x,y2);
box off