function [] = plotep6(X,Y)
%函数plotep6(X,Y)
%输入需要计算的横坐标X
%输入需要计算的全部数据Y
X0 = Y(1);
Y(:,1) = [];
Y = Y/X0;                  %根据公式计算纵坐标
scatter(X,Y,'*');           %画散点图
hold on;
p = polyfit(X,Y,1);         %做拟合曲线再画图
yy = polyval(p,X);
plot(X,yy);
xlabel('电压(V)');ylabel('功率放大倍数G_{e}');
end