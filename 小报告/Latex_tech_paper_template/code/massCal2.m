function y=massCal2(gamma)
%函数调用格式：airMass=massCal2(gamma)
%输入参数说明：gamma是天顶角，单位是°
%输出参数说明：airMass是大气质量
a=0.50572;b=6.07995;c=1.6364;
y=(sin(gamma*pi/180)+a*(gamma+b).^(-c)).^(-1);
end