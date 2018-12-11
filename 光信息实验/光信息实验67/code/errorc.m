function [T,K] = errorc(p,X,Y)
%函数[T,Y]=error30(X,Y)，每三次计算一次
%输入你需要的插值的范围p，取大于30,否则少点
%输入需要计算的矩阵X
%输入平均值矩阵Y
%输出原值和平均值之间的差值K
%把差值大于30的去掉之后的T，在T里面也就是全部设置为0
[row,~] = size(X);
j=1;
for i=1:row
    K(i) = X(i) - Y(j);
    if(i == row)
        break;
    end
    if(rem(i,3) == 0)
        j=j+1;
    end
end
%把误差大于p的都去掉
T = X;
for i=1:row
    if(abs(K(i)>=p))
       T(i,:) = 0;  
    end
end

end