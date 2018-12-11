function y=massCal3(gamma)
%函数调用格式：airMass=massCal(gamma)
%输入参数说明：gamma是天顶角，单位是°
%输出参数说明：airMass是大气质量
a=0.6556;b=6.379;c=1.757;
y=(sin(gamma*pi/180)+a*(gamma+b).^(-c)).^(-1);
end