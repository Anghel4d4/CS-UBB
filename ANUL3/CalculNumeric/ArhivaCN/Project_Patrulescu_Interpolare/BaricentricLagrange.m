function BaricentricLagrange
    close all
    clear all
    clc
    %inline function as lambda function
    fi=@(x) abs(x)+0.5*x-x.^2;
    n=10;
    %xx=linspace(-1,1,n);
    %x1=linspace(-1,1,n);
    %y1=fi(x1);
    %yy1=baryLagrange(x1,y1,xx); 
    
    a=-5;% capetele intervalului
    b=5;
    nx=10;
    %nx=11;
    %pas = 0.01;
    pas=1;
    xx=a:pas:b;
    x1 = linspace(a,b,nx);
    y1 = fi(x1);
    yy1=baryLagrange(x1,y1,xx); 
    
    figure(1)
    hold on
    box on
    title('Metoda Baricentrica')
    plot(x1,y1,'r*',xx,yy1,':.')
    %plot(x1,y1,'r*')
    %plot(x1,y1,'r*',xx,yy1)
    %plot(xx,yy1,x1,y1,'r*',xx,fi(xx))
    %plot(xx,yy1)