xt=[];
yt=[];
clf; axis ([0 2 0 1]);
grid on;
hold on;
set(gcf,'currentchar','1')
while get(gcf,'currentchar') == '1'
    [x,y]=ginput(1);
    plot(x,y,'*k');
    xt=[xt,x]
   yt=[yt,y];
end
tt=0:0.001:1;
t=linspace(0,1,length(xt));

% [a,b,c,d]=Splinecubic(t,xt,1);
% sx=evalspline(t,a,b,c,d,tt);

% sx=lagrbar(t,xt,tt);
% sy=lagrbar(t,yt,tt);
x = [0 0 0 0 0]

sx=hermit(t,xt,x,tt);
sy=hermit(t,yt,x,tt);

% [a,b,c,d]=Splinecubic(t,yt,1);
% sy=evalspline(t,a,b,c,d,tt);

plot(sx,sy);