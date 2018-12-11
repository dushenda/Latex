clear;clc;
data = xlsread('C:\Users\���\Desktop\����Ϣʵ��\����Ϣ��ѧ����ʵ��.xlsx','���˹�դ�¶ȴ������Բ���','A3:B10');
lambda = data(:,1);
T = data(:,2);
scatter(lambda,T,'m*');
p = polyfit(lambda,T,1);
lambda1 = 1540:0.01:1541;
TT = polyval(p,lambda1);
hold on
plot(lambda1,TT,'b','linewidth',2);
xlabel('����\lambda(nm)');
ylabel('�¶�T(��)');
title('���˹�դ�¶��벨���Ĺ�ϵ');
text(1540.532,61,['\leftarrow б��k=',num2str(round(p(1)))],'FontSize',12);
set(gca,'FontSize',12,'Fontname','New Times Roman');
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 1000 800]);
print -djpeg -r600 ���˹�դ�¶��벨���Ĺ�ϵ
