    I_oringin=imread(['加DOE移CCD',num2str(24+j),'cm.bmp']);
    title(['横坐标x=',num2str(t),'截面的亮度曲线']);
    print('-painters','-deps',['addDOEmoveCCD',num2str(24+j)]);
