function [yy] = grafic(x1,x11,x2,x21,y1,y11,y2,y21)
%program principal cubica
t=0:0.025:1;
%x1,x11,x2,x21,y1,y11,y2,y21
%coordonatele punctelor si derivatele reprezentarii parametrice in ele
for i=1:41
    x(i)=hermite(x1,x11,x2,x21,t(i));
    y(i)=hermite(y1,y11,y2,y21,t(i));
end
plot(x,y)
gtext('Grafic curba parametric cubica')