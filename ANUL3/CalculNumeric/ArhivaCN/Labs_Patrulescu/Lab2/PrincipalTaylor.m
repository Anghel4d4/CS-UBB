function PrincipalTaylor
    clear all
    close all
    n=20;
    x=0:0.01:2*pi;
    xp=0:0.1:2*pi;
    figure(1)
    hold on
    plot(x,sin(x),'b')
    plot(xp,Taylor(xp,n,'sinus'),'r*')
    
    figure(2)
    hold on
    plot(x,cos(x),'b')
    plot(xp,Taylor(xp,n,'cosinus'),'r*')
    
    x=-5:0.01:5;
    xp=-5:0.1:5;
    figure(3)
    hold on
    plot(x,exp(x),'b')
    plot(xp,Taylor(xp,n,'exponent'),'r*')