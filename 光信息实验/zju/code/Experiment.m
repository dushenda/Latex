%Experiment of Light Information Science&Technology
%measure thin and reflection
clear;clc;
data_PI = xlsread('C:\Users\沈达\Desktop\光信息实验\光信息科学技术实验.xlsx','用m线法测量有机聚合物平面光波导的厚度和折射率','A3:B8851');
%公式:角度(theta)=步数*（360 / 传动比(180) / 电机每圈步数(200) / 电机细分数(16)）
data_PI(1,:) = [];
theta = data_PI(:,1)*(360/180/200/16);
voltage = data_PI(:,2);
plot(theta,voltage,'linewidth',2);hold on;
xlabel('入射角\theta(°)');
ylabel('光强信号电压U(V)');
title('U-\theta扫描曲线');
set(gca,'FontSize',10,'Fontname','Yahei Consolas Hybrid');
box off
%寻找峰值
[peaks,locs] = findpeaks(-voltage,'minpeakheight',-5,'minpeakdistance',1);
j=1;
for i=1:1:size(locs)-1
    if(abs(locs(j+1)-locs(j))<1000)
        if(peaks(j+1)<peaks(j))
            peaks(j+1)=[];
            locs(j+1)=[];
        else
            peaks(j)=[];
            locs(j)=[];
        end
    else
        j=j+1;
    end        
end
%在图上标出峰值
plot(theta(locs),voltage(locs),'*r');
MarkLocationTheta = [theta(locs(1))+0.1 theta(locs(2))+0.1];
MarkLocationVoltage = [voltage(locs(1)) voltage(locs(2))];
str = {['(',num2str(theta(locs(1))),',',num2str(voltage(locs(1))),')',],['(',num2str(theta(locs(2))),',',num2str(voltage(locs(2))),')']};
text(MarkLocationTheta,MarkLocationVoltage,str);
box off
print -djpeg -r600 m线法测量实验的U-theta的0阶和1阶模的曲线
%得到耦合状态下的theta和voltage(0阶和1阶模式)
theta_peak = theta(locs);
theta_peakArc = theta(locs)*pi/180;
voltage_peak = voltage(locs);
%根据公式计算，np=1.750是三棱镜折射率
np = 1.750;
alpha = 60 - asin(sin(theta_peakArc)/np);
%betam为m阶波导的传播常数，k0是真空中的波矢k0=1/lambda;
lambda = 650*(10^(-9));%波长是650nm                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
k0 = 2*pi/lambda;%真空中的波矢
alphaArc = alpha*pi/180;
betam = k0*np*sin(alphaArc); 

syms epsilon1 h;
epsilon2 = 1.75^2;%三棱镜
epsilon3 = -17.0373;%epsilon3 = (real((0.14+4.13*i)^2)),%金属略去虚部

k0 = k0*[1;1];
kapa = (k0.^2*epsilon1-betam.^2).^(1/2);
p = (betam.^2-k0.^2*epsilon2).^(1/2);
q = (betam.^2-k0.^2*epsilon3).^(1/2);
x1 = kapa(1)*h;
x2 = kapa(2)*h;
y1 = atan(p(1)/kapa(1))+atan(q(1)/kapa(1));
y2 = 3.14+atan(p(2)/kapa(2))+atan(q(2)/kapa(2));
e1 = y1-x1;
e2 = y2-x2;
%e1,e2作图与z=0的交点
figure(2)
strx = (['z=\kappa_{m}h-m\pi+tan^{-1}({p_{m}}/{\kappa_{m}})+tan^{-1}({q_{m}}/{\kappa_{m}})=0 m=0,1']);
suptitle(strx)
set(gca,'FontSize',10,'Fontname','New Times Roman');
subplot(2,2,1)
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('正常视角');
zlabel('z');

subplot(2,2,2);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('主视图');
view(0,0)
zlabel('z');

subplot(2,2,3);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('左视图');
view(90,0)
zlabel('z');

subplot(2,2,4);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('俯视图');
view(0,90)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1200 1080]);
print -djpeg -r600 方程求解可视化
%求解超越方程
[epsilon1,h] = solve(e1,e2);
t=double([real(epsilon1),real(h)]);
disp('epsilon1=')
disp(t(1));
disp('折射率n=');
disp(sqrt(t(1)));
disp('波导层的厚度h(um)=');
disp(num2str(t(2)*10^(6)));

