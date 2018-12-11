clear;clc;
x1=1:27;x2=1:28;
y1=load('C:\Users\dushenda\Desktop\wang\1.txt');
y2=load('C:\Users\dushenda\Desktop\wang\2.txt');
plot(x1,y1,'--',x2,y2);
xlabel('通道数');ylabel('计数率(CS)');
legend('数据1','数据2');
print('channel','-deps');
figure(2)
y3=load('C:\Users\dushenda\Desktop\wang\3.txt');
y4=load('C:\Users\dushenda\Desktop\wang\4.txt');
x34=1:8192;
plot(x34,y3',x34,y4','--');
xlim();ylim([0 500]);
xlabel('电压(V)');ylabel('计数率(CS)');
legend('数据3','数据4');
print('voltage','-deps');
figure(3)
for i=1:4
    subplot(2,2,i)
    plot(x34,y3',x34,y4','--');
    xlim([0 1000-200*(i-1)]);ylim([0 5000-200*(i-1)]);
    xlabel('电压(V)');ylabel('计数率(CS)');
    legend('数据3','数据4');
end
print('voltagesub','-deps');
