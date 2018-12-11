%Experiment of Light Information Science&Technology
%�뵼�弤�����Ĺ�ѧ���Բ���
clear;clc;
data_PI = xlsread('C:\Users\���\Desktop\����Ϣʵ��\����Ϣ��ѧ����ʵ��.xlsx','�뵼�弤�����Ĺ�ѧ����','A3:B24');
figure(1)
subplot(1,2,1);
scatter(data_PI(:,1),data_PI(:,2));
xlabel('����I(mA)');
ylabel('����P(mW)');
title('�뵼�弤������P-I���߲�����');
set(gca,'FontSize',10,'Fontname','New Times Roman');
subplot(1,2,2)
plot(data_PI(:,1),data_PI(:,2),'linewidth',2);
xlabel('����I(mA)');
ylabel('����P(mW)');
title('�뵼�弤������P-I����');
set(gca,'FontSize',10,'Fontname','New Times Roman');
box off
print -djpeg -r600 �뵼�弤����P-I����
data_Pphi = xlsread('C:\Users\���\Desktop\����Ϣʵ��\����Ϣ��ѧ����ʵ��.xlsx','�뵼�弤�����Ĺ�ѧ����','G3:H22');

figure(2)
subplot(3,1,1);
scatter(data_Pphi(:,1),data_Pphi(:,2));
xlabel('��ɢ��\phi(��)');
ylabel('����P(mW)');
title('�뵼�弤������ɢ��ɢ��ͼ');
set(gca,'FontSize',10,'Fontname','New Times Roman');
subplot(3,1,2);
plot(data_Pphi(:,1),data_Pphi(:,2),'linewidth',2);
xlabel('��ɢ��\phi(��)');
ylabel('����P(mW)');
title('�뵼�弤������ɢ�ǲⶨ����');
set(gca,'FontSize',10,'Fontname','New Times Roman');
% [peaks,locs] = findpeaks(data_Pphi(:,2),'minpeakheight',-5,'minpeakdistance',1);
box off
subplot(3,1,3)
values = spcrv(data_Pphi');
plot(values(1,:),values(2,:), 'b','linewidth',2);
xlabel('��ɢ��\phi(��)');
ylabel('����P(mW)');
title('�⻬�����İ뵼�弤������ɢ�ǲⶨ����');
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
text(60,half,'��ֵ��һ��λ��');
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
disp('����=');
disp(delta_phi);
box off
text(35,half-10,['\Delta\phi=',num2str(delta_phi),'��']);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1200 1080]);
print -djpeg -r600 �뵼�弤������ɢ�ǲⶨ����
%�����ϲ��ᰡ
% figure(3)
% 
% %�Զ�����Ϻ���f(t)=K/(sigma*((2*pi)^(1/2)))*exp(-((x-mu)^2)/(2*sigma^2))
% x=data_Pphi(:,1);
% y=data_Pphi(:,2);
% %fittype���Զ�����Ϻ���
% f=fittype('2000/(sigma*((2*pi)^(1/2)))*exp(-((x-mu)^2)/(2*sigma^2))','independent','x','coefficients',{'mu','sigma'});  
% %�����Զ�����Ϻ���f���������x��y
% cfun=fit(x,y,f) %�����Զ�����Ϻ���f���������x��y
% xi=-100:0.5:100;
% yi=cfun(xi);
% plot(x,y,'k*',xi,yi,'b-')
% xlabel('��ɢ��\phi(��)');
% ylabel('����P(mW)');
% title('�뵼�弤������ɢ����̬�������');
% set(gca,'FontSize',10,'Fontname','New Times Roman');
% box off




