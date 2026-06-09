function ExInterpMatlab
    close all
    clc
    
    a=-5;% capetele intervalului
    b=5;
    nx=10;
    %nx=11;
    %pas = 0.01;
    pas=1;
    z=a:pas:b;
    
    x = linspace(a,b,nx);
    y = fL(x);
    zv = interp1(x,y,z);
    
    figure(1)
    hold on
    box on
    title('Interp1')
    plot(x,y,'r*',z,zv,':o')