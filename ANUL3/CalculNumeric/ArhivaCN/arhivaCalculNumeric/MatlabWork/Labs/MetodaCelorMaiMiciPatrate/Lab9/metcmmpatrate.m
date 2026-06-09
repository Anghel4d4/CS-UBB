function metcmmpatrate(x,f,k)
    
    X = linspace(min(x), max(x), 1000);
    
    plot(x,f,'*');
    hold on
    plot(X, polyval(polyfit(x,f,k),X));
    
%     x1 = linspace(0,4*pi);
%     y1 = polyval(p,x1);
%     figure
%     plot(x,y,'o')
%     hold on
%     plot(x1,y1)