function Newton(n)
if~isequal (get(gcf,'tag'),'Newton')
    shg
    clf reset
   
    uicontrol('position',[300 5 25 22], 'string' ,'>','callback','Newton(''+1'')');
    set(gcf,'tag','Newton');
end
if nargin==0
    n=1;
elseif isequal(n,'+1')
     n=get(gcf,'userdata')+1;
end
if n<1,n=1;end
set(gcf,'userdata',n)


xmin=1;
xmax=3.5;
x=xmin:0.1:xmax;

x1=3.5;

 figure(1)
 hold on
box on

line([xmin, xmax],[0, 0],'Color','k','LineWidth',2)
axis([xmin-0.2 xmax+0.2 min(f(x))-0.2 max(f(x))+0.2])
plot(x,f(x),'Color','b','LineWidth',2)
for i=1:n
    if i==1
        plot(x1,0,'go')
        text(x1,0.2,'x_1')
     line([x1 x1],[0,f(x1)],'Color','g','LineWidth',2)
    
    else
x2=x1-f(x1)/fderiv(x1);
plot(x1,f(x1),'r*','MarkerSize',7)
line([x1 x2],[f(x1),0],'Color','r','LineWidth',2)
line([x2 x2],[0,f(x2)],'Color','g','LineWidth',2)
x1=x2;
 plot(x1,0,'go')
 text(x1,0.2,['x_',num2str(i)])
    end
end

 title(num2str(n))