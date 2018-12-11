%半导体激光器的光学特性测试
clear;clc;
data_PI = xlsread('C:\Users\沈达\Desktop\光信息实验\光信息科学技术实验.xlsx','半导体激光器的光学特性','A3:B24');
figure(1)
subplot(1,2,1);
scatter(data_PI(:,1),data_PI(:,2));
xlabel('电流I(mA)');
ylabel('功率P(mW)');
title('半导体激光器的P-I曲线测量点');
set(gca,'FontSize',10,'Fontname','New Times Roman');
subplot(1,2,2)
plot(data_PI(:,1),data_PI(:,2),'linewidth',2);
xlabel('电流I(mA)');
ylabel('功率P(mW)');
title('半导体激光器的P-I曲线');
set(gca,'FontSize',10,'Fontname','New Times Roman');
box off
print -djpeg -r600 半导体激光器P-I曲线