function X = mean3(Y)
%Y=mean3(X,row)
%函数输出隔三次求均值的矩阵,当然，里面不能有0，有0就跳过舍去
%输入需要计算的矩阵行数row
%输入需要计算的矩阵X
[row,~] = size(Y);
j = 1;
X(j) = 0;
for i=1:row
    X(j) = X(j) + Y(i);
    if(rem(i,3) == 0)
            switch ((Y(i)==0)+(Y(i-1)==0)+(Y(i-2)==0))
                case 0
                    X(j) = X(j)/3;
                case 1
                    X(j) = X(j)/2;
                case {2,3}
                    X(j) = X(j);
            end
        if(i == row)
            break;
        end
        j = j+1;
       X(j) = 0;
    end
end
end