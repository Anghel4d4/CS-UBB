function Curbe
    close all
    a=5; b=1;
    t = 0:0.01:10*pi;
    x=(a+b)*cos(t)-b*cos((a/b+1)*t);
    y=(a+b)*sin(t)-b*sin((a/b+1)*t);
    x1=(a-b)*cos(t)+b*cos((a/b-1)*t);
    y1=(a-b)*sin(t)-b*sin((a/b-1)*t);
    
    figure(1)
    hold on
    plot(x,y,'Color','b','LineWidth',2)
    title('Epicicloid')
    figure(2)
    hold on
    plot(x1,y1,'Color','r','LineWidth',2)
    title('Hipocicloida')
    
    x=-1:0.01:1;
    
    t1=2*x.^2-1;
    t2=4*x.^3-3*x;
    t3=8*x.^4-8*x.^2+1;
    t4=16*x.^5-20*x.^3+5*x;
    
    figure(3)
    hold on
    plot(x,t1,'Color','b','LineWidth',2)
    plot(x,t2,'Color','r','LineWidth',2)
    plot(x,t3,'Color','g','LineWidth',2)
    plot(x,t4,'Color''k','LineWidth',2)

    box on