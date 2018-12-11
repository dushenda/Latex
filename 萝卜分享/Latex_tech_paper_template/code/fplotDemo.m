clear;clc
syms x
y=sin(x)/x;
fplot(y);
tex=texlabel('y=sin alpha/alpha');
text(3,0.8,tex);
grid on;box off