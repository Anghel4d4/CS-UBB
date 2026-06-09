function Lagrange
    clear all
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
    
    li_z=li(z,x);
    
    figure(1)
    hold on
    box on
    title('Polinoame Lagrange noduri echidistante')
    plot(x,zeros(1,nx),'r*')
    plot(z,li_z(1:nx,:))
    
   
    