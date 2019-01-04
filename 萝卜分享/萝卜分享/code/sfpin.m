function sfpin(y)
y = y(:);
N = length(y);
L = floor(1.87*(N-1)^0.4);          %取的每个直方图的横坐标的长度，是个公式
[Y,X] = hist(y,L);                  %Y是count，也就是每个部分的点的数目
                                    %X是center，也就是每个直方图x的中心点
ind = find(Y==0);                   %将在特定区间内没有分布点的部分去除
X(ind) = [];Y(ind) = [];
xt1 = 1.5*X(1) - X(2)*0.5;          %确定开始点也就是x(1)-(x(2)-x(1))/2
xtt = X(1:end-1)*0.5+X(2:end)*0.5;  %确定各个柱子的边缘值
xt2 = 1.5*X(end) - X(end-1)*0.5;    %确定末尾,也就是x(end)-(x(end)-x(end-1))/2
X = [xt1,xtt,xt2];
n = sum(Y);                         %计算频率
Y = Y/n;
xx = [X;X];yy = [Y;Y];
Xt = xx(:);Yt = [0;yy(:);0];  
%fill会根据离散点作图，离散点的连线也就是边缘线，所以需要前面的操作
fill(Xt',Yt,'c');                   
hold on
x1 = (X(2:end)+X(1:end-1))/2;       %计算柱子的中间值
XX = [Xt';Xt'];                     %
YY = [Yt';zeros(1,length(Yt))];
plot(x1,Y,'-k',Xt,Yt,'-k',XX,YY,'-k')%连中心点画图，画横线，画内部分隔竖线
hold off
title('频率直方图')
end