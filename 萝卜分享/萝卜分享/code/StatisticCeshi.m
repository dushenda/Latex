clear;clc
x=rands(1,20)*10;
dts(x);
fws(x);
subplot(2,2,1)
plot(x);
title('原始数据图');
subplot(2,2,2)
boxplot(x);
title('箱线图');
subplot(2,2,3)
qqs(x);
subplot(2,2,4)
bar(x)
grid on;box off;
title('直方图');
print('fourSF','-deps');
figure(2)
subplot(1,2,1)
sfpin(x);
subplot(1,2,2)
N = length(x);
L = floor(1.87*(N-1)^0.4);
[counts,centers] = hist(x, L);
yy = counts/sum(counts);
bar(centers, yy);
xx = centers;
hold on
plot(xx,yy);
title('频率直方图');
print('freBar','-deps');