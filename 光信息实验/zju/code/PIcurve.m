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