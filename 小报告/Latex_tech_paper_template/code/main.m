clear;clc;
%x的步长选取
x1=0:0.1:20;
x2=20.2:0.2:30;
x3=30.5:0.5:55;
x4=56:1:90;
x=[x1,x2,x3,x4];
%定义Latxe字符
gamma=texlabel('gamma');flambda=texlabel('f(lambda)');
txt = texlabel('f(lambda)=[sin gamma+a(gamma+b)^{-c}]^{-1}');
%输入标准数据，画标准数据图像
data=xlsread('datain.xlsx');
datax=data(:,1);
datay=data(:,2);
plot(datax,datay);
xlabel(['天顶角',gamma]);ylabel({'标准的相对大气质量';flambda});
print('Standard','-deps');
%调用三个计算函数
airMass1=massCal1(x);
airMass2=massCal2(x);
airMass3=massCal3(x);
%画图指令
figure(2);
set(figure(2),'PaperSize',[42,60]);
suptitle(['\fontsize{14}',txt]);
subplot(3,1,1)
plot(x,airMass1);
text(60,30,'a=0.1500,b=3.885,c=1.253');
xlabel(['天顶角',gamma]);ylabel({'计算的相对大气质量';flambda});
subplot(3,1,2)
plot(x,airMass2);
text(60,30,'a=0.50572,b=6.07995,c=1.6364');
xlabel(['天顶角',gamma]);ylabel({'计算的相对大气质量';flambda});
subplot(3,1,3)
plot(x,airMass3);
text(60,30,'a=0.6556,b=6.379,c=1.757');
xlabel(['天顶角',gamma]);ylabel({'计算的相对大气质量';flambda});
set(gcf, 'position', [1920/4 1080/4 1920/2 1080/1.5]);
print('Calculate','-deps');
%画三个函数的误差曲线
datay=datay';
delta1 = (airMass1-datay)./datay*100;
delta2 = (airMass2-datay)./datay*100;
delta3 = (airMass3-datay)./datay*100;
figure(3)
plot(x,delta1);hold on
plot(x,delta2,'--');hold on
plot(x,delta3,':');
xlabel(['天顶角',gamma]);ylabel('三种大气质量的误差(%)');
legend('第1组拟合系数','第2组拟合系数','第3组拟合系数');
print('Error','-deps');