clear;clc;
data = xlsread('C:\Users\沈达\Desktop\光信息实验\光信息科学技术实验.xlsx','光纤光栅温度传感特性测试','A3:B10');
lambda = data(:,1);
T = data(:,2);
scatter(lambda,T,'m*');
p = polyfit(lambda,T,1);
lambda1 = 1540:0.01:1541;
TT = polyval(p,lambda1);
hold on
plot(lambda1,TT,'b','linewidth',2);
xlabel('波长\lambda(nm)');
ylabel('温度T(℃)');
title('光纤光栅温度与波长的关系');
text(1540.532,61,['\leftarrow 斜率k=',num2str(round(p(1)))],'FontSize',12);
set(gca,'FontSize',12,'Fontname','New Times Roman');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1000 800]);
print -djpeg -r600 光纤光栅温度与波长的关系
