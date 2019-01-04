function fws(x)
a=x(:);
a(isnan(a)) = [];
ss50 = prctile(x,50);
disp(['中位数：',num2str(ss50)]);
ss25 = prctile(x,25);
disp(['下四分点：',num2str(ss25)]);
ss75 = prctile(x,75);
disp(['上四分点：',num2str(ss75)]);
RS = ss75 - ss25;
disp(['四分位极差：',num2str(RS)]);
sss = 0.25*ss25+0.5*ss50+0.25*ss75;
disp(['三均值：',num2str(sss)]);
xjie = ss25 - 1.5*RS;
disp(['下截断点：',num2str(xjie)]);
sjie = ss75 +1.5*RS;
disp(['上截断点：',num2str(sjie)]);
end