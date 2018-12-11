%Experiment of Light Information Science&Technology
%measure thin and reflection
clear;clc;
data_PI = xlsread('C:\Users\���\Desktop\����Ϣʵ��\����Ϣ��ѧ����ʵ��.xlsx','��m�߷������л��ۺ���ƽ��Ⲩ���ĺ�Ⱥ�������','A3:B8851');
%��ʽ:�Ƕ�(theta)=����*��360 / ������(180) / ���ÿȦ����(200) / ���ϸ����(16)��
data_PI(1,:) = [];
theta = data_PI(:,1)*(360/180/200/16);
voltage = data_PI(:,2);
plot(theta,voltage,'linewidth',2);hold on;
xlabel('�����\theta(��)');
ylabel('��ǿ�źŵ�ѹU(V)');
title('U-\thetaɨ������');
set(gca,'FontSize',10,'Fontname','Yahei Consolas Hybrid');
box off
%Ѱ�ҷ�ֵ
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
%��ͼ�ϱ����ֵ
plot(theta(locs),voltage(locs),'*r');
MarkLocationTheta = [theta(locs(1))+0.1 theta(locs(2))+0.1];
MarkLocationVoltage = [voltage(locs(1)) voltage(locs(2))];
str = {['(',num2str(theta(locs(1))),',',num2str(voltage(locs(1))),')',],['(',num2str(theta(locs(2))),',',num2str(voltage(locs(2))),')']};
text(MarkLocationTheta,MarkLocationVoltage,str);
box off
print -djpeg -r600 m�߷�����ʵ���U-theta��0�׺�1��ģ������
%�õ����״̬�µ�theta��voltage(0�׺�1��ģʽ)
theta_peak = theta(locs);
theta_peakArc = theta(locs)*pi/180;
voltage_peak = voltage(locs);
%���ݹ�ʽ���㣬np=1.750�����⾵������
np = 1.750;
alpha = 60 - asin(sin(theta_peakArc)/np);
%betamΪm�ײ����Ĵ���������k0������еĲ�ʸk0=1/lambda;
lambda = 650*(10^(-9));%������650nm                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
k0 = 2*pi/lambda;%����еĲ�ʸ
alphaArc = alpha*pi/180;
betam = k0*np*sin(alphaArc); 

syms epsilon1 h;
epsilon2 = 1.75^2;%���⾵
epsilon3 = -17.0373;%epsilon3 = (real((0.14+4.13*i)^2)),%������ȥ�鲿

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
%e1,e2��ͼ��z=0�Ľ���
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
title('�����ӽ�');
zlabel('z');

subplot(2,2,2);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('����ͼ');
view(0,0)
zlabel('z');

subplot(2,2,3);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('����ͼ');
view(90,0)
zlabel('z');

subplot(2,2,4);
ezmesh(e1);
hold on 
ezmesh('0')
hold on
ezmesh(e2);
title('����ͼ');
view(0,90)
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1200 1080]);
print -djpeg -r600 ���������ӻ�
%��ⳬԽ����
[epsilon1,h] = solve(e1,e2);
t=double([real(epsilon1),real(h)]);
disp('epsilon1=')
disp(t(1));
disp('������n=');
disp(sqrt(t(1)));
disp('������ĺ��h(um)=');
disp(num2str(t(2)*10^(6)));

