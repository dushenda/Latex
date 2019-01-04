function dts(x)
a = x(:);
nans = isnan(a);
ind = find(nans);
a(ind) = [];
xbar = mean(a);
disp(['均值：',num2str(xbar)]);
s2 = var(a);
disp(['方差：',num2str(s2)]);
S = std(a);
disp(['标准差：',num2str(S)]);
R = range(a);
disp(['极差：',num2str(R)]);
CV = 100*S/xbar;
disp(['变异系数：',num2str(CV)]);
g1 = skewness(a,0);
disp(['偏度：',num2str(g1)]);
g2 = kurtosis(a,0);
disp(['峰度：',num2str(g2)]);
end