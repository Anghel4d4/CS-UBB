function lab1_1
    close all
    x=0:0.1:2*pi;
    f1=sin(x);
    f2=cos(x);
    f3=cos(2*x);
    
    figure(1)
    plot(x,f1,'r')
    
    figure(2)
    plot(x,f2,'color',[1,0,0])
    
    figure(3)
    plot(x,f3,'color','k','LineWidth',3)
    
    figure(4)
    hold on
    
    plot(x,f1,'b')
    plot(x,f2,'r')
    plot(x,f3,'k')
    legend('f1','f2','f3')
    
    text(0,0,'Grafice')
    title('Grafice')
    
    xlabel('Variabila x')
    ylabel( 'f1','f2','f3')
    
    box on
    