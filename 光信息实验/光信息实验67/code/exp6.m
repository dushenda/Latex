%参数解释：
%E1，E2分别代表本底和激光加本底的能量值
%E3代表激光的能量值
%EE3代表8次测量的平均值
clear;clc;
data = xlsread('C:\Users\dushenda\Desktop\光信息实验.xlsx','激光放大器特性研究');
[row,col] = size(data);
x = [0,650,700,750,800,850,900];
E1 = data(:,2);
E2 = data(:,3);
E3 = E2 - E1;
EE3 = mean3(E3);                    %计算平均，后同
EE3_8 = EE3;
plotep6(x,EE3);                     %绘图拟合
print('Nd_AllFitCurve','-depsc');

figure(2)
%计算一下每个数和平均值之间的差值
subplot 221
[EEE3,~]=errorc(30,E3,EE3);
EE3_2 = mean3(EEE3);
plotep6(x,EE3_2);                   %第二次绘图拟合,误差30
title('误差取30');
subplot 222
[EEE3_2,~]=errorc(35,E3,EE3);
EE3_3 = mean3(EEE3_2);
plotep6(x,EE3_3);                   %第3次绘图拟合,误差35
title('误差取35');
subplot 223
[EEE3,~]=errorc(40,E3,EE3);
EE3_3 = mean3(EEE3);
plotep6(x,EE3_3);                   %第二次绘图拟合,误差40
title('误差取40');
subplot 224
[EEE3,~]=errorc(50,E3,EE3);
EE3_4 = mean3(EEE3);
plotep6(x,EE3_4);                   %第二次绘图拟合,误差50
title('误差取50');
print('Nd_DiffErr','-depsc');

figure(3)
for i=1:3
E3(1,:) = []; 
end
y = E3/EE3(1);
xx = repmat(x,[3,1]);
for i = 1:(row-3)
scatter(xx(i),y(i),'*');
hold on;
end
xlabel('电压');ylabel('功率放大倍数G_{e}');
title('Nd:YAG激光放大器实验的测量点');
print('Nd_AllPoints','-depsc');
