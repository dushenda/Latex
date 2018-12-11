%Experiment of Light Information Science&Technology
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
data_Pphi = xlsread('C:\Users\沈达\Desktop\光信息实验\光信息科学技术实验.xlsx','半导体激光器的光学特性','G3:H22');

figure(2)
subplot(3,1,1);
scatter(data_Pphi(:,1),data_Pphi(:,2));
xlabel('发散角\phi(°)');
ylabel('功率P(mW)');
title('半导体激光器发散角散点图');
set(gca,'FontSize',10,'Fontname','New Times Roman');
subplot(3,1,2);
plot(data_Pphi(:,1),data_Pphi(:,2),'linewidth',2);
xlabel('发散角\phi(°)');
ylabel('功率P(mW)');
title('半导体激光器发散角测定曲线');
set(gca,'FontSize',10,'Fontname','New Times Roman');
% [peaks,locs] = findpeaks(data_Pphi(:,2),'minpeakheight',-5,'minpeakdistance',1);
box off
subplot(3,1,3)
values = spcrv(data_Pphi');
plot(values(1,:),values(2,:), 'b','linewidth',2);
xlabel('发散角\phi(°)');
ylabel('功率P(mW)');
title('光滑处理后的半导体激光器发散角测定曲线');
set(gca,'FontSize',10,'Fontname','New Times Roman');
[peak,loc] = findpeaks(values(2,:),'minpeakheight',100,'minpeakdistance',50);
hold on
plot(values(1,loc),peak,'ro');
str = (['(',num2str(round(values(loc))),',',num2str(round(peak)),')']);
text(values(1,loc)+1,peak+2,str);
half = peak/2;
hold on
x=30:1:60;
y=half+0*x;
plot(x,y);
text(60,half,'极值的一半位置');
min=half-values(2,1);
for i=1:1:139
    if(values(2,i)<half)
        if min>half-values(2,i)
            min = half - values(2,i);
        end
    else
        break;
    end
end
for j=1:139
    if(values(2,139-j)>half)
        break
    end
end
halfx1=(values(1,i)+values(1,i+1))/2;
halfx2=(values(1,139-j)+values(1,139-j+1))/2;
delta_phi = halfx2-halfx1;
plot(halfx1,half,'r*',halfx2,half,'r*');
str1=(['(',num2str(round(halfx1)),',',num2str(round(half)),')']);
str2=(['(',num2str(round(halfx2)),',',num2str(round(half)),')']);
text(halfx1+1,half+6,str1);
text(halfx2+1,half+6,str2);
disp('Δφ=');
disp(delta_phi);
box off
text(35,half-10,['\Delta\phi=',num2str(delta_phi),'°']);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1200 1080]);
print -djpeg -r600 半导体激光器发散角测定曲线
%这个拟合不会啊
% figure(3)
% 
% %自定义拟合函数f(t)=K/(sigma*((2*pi)^(1/2)))*exp(-((x-mu)^2)/(2*sigma^2))
% x=data_Pphi(:,1);
% y=data_Pphi(:,2);
% %fittype是自定义拟合函数
% f=fittype('2000/(sigma*((2*pi)^(1/2)))*exp(-((x-mu)^2)/(2*sigma^2))','independent','x','coefficients',{'mu','sigma'});  
% %根据自定义拟合函数f来拟合数据x，y
% cfun=fit(x,y,f) %根据自定义拟合函数f来拟合数据x，y
% xi=-100:0.5:100;
% yi=cfun(xi);
% plot(x,y,'k*',xi,yi,'b-')
% xlabel('发散角\phi(°)');
% ylabel('功率P(mW)');
% title('半导体激光器发散角正态拟合曲线');
% set(gca,'FontSize',10,'Fontname','New Times Roman');
% box off




