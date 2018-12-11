clear;clc;
data = xlsread('C:\Users\dushenda\Desktop\光信息实验.xlsx','激光倍频');
[row,col] = size(data);
x = [0,650,700,750,800,850,900];
E1 = data(:,2);
E2 = data(:,3);
E3 = E2 - E1;
EE3 = mean3(E3);  
Ey = [162,171,233,300,365,506];
phi = (Ey - EE3)./Ey;
x = Ey/2;
scatter(Ey/2,phi,'*');
hold on
p = polyfit(phi,x,1);
z = polyval(p,phi);
plot(z,phi);
xlabel('能量E_{w}');ylabel('倍频比η');
print('exp7','-depsc');