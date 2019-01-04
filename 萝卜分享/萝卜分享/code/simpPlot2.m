x=[-0.3,0.5,1,-2,3,-4];     %读入信号
xDigital=round(x/0.15);     %四舍五入，量化成二进制数
y=xDigital*0.15;            %计算数字化后的信号
Error=y-x;                  %计算模拟信号和数字信号之间的误差
figure(1)                   %画两信号图
stem(x);
hold on
stem(y);
xlim([0 6]);
xticks(0:1:6);
legend('Origin Signal','Digital Siginal');
xlabel('Signal');ylabel('Alputium');
title('Siginal and Alputium');
figure(2)                   %画绝对误差图
stem(Error);
xticks(0:1:6);
xlabel('Signal');ylabel('Error');
title('Absolute Error');
figure(3)                   %画相对误差图
stem(Error./x);
xlabel('Signal');ylabel('Error');
title('Relative Error');