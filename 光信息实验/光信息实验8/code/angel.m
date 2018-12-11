clear;clc;
rangeL=120;rangeH=160;
k=randperm((rangeH-rangeL),4)+rangeL;
for j=1:5                                   
    I_oringin=imread(['加DOE转角度',num2str(j),'.bmp']);
    d=double(I_oringin(:,:,1));                 
    figure(j)
    for i=1:4
        subplot(2,2,i)
        t=k(i);
        dd=double(I_oringin(:,t,1));
        plot(dd);
        title(['横坐标x=',num2str(t),'截面的亮度曲线']);
        xlabel('y');ylabel('亮度');
    end
    print('-painters','-deps',['addDOEangel',num2str(j)]);
end