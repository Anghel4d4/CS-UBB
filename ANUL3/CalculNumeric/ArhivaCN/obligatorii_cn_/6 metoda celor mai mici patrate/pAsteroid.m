format short;
close all;
x=[ -1.024940, -0.949898, -0.866114, -0.773392, -0.671372, -0.559524 -0.437067, -0.302909, -0.159493, -0.007464]';
y=[-0.389269, -0.322894, -0.265256, -0.216557, -0.177152, -0.147582, -0.128618, -0.121353, -0.127348, -0.148895]';

% verificam daca e eliptic (ramane intr-o elipsa)
A=[y.^2, x.*y, x, y, ones(size(x))];
md = x.^2;

coef=A\md;
a=coef(1); b=coef(2); c=coef(3); d=coef(4); e=coef(5);
disp([a,b,c,d,e]);

u=linspace(-2,2,40);
v=linspace(-3,0,40);
[X, Y]=meshgrid(u,v);  % produs cartezian intre u si v 

z=a*Y.^2+b*X.*Y+c*X+d*Y+e-X.^2;
figure(1);
contour(X,Y,z,[0,0]); hold on
plot(x,y,'o');

ere= norm(a*y.^2+b*x.*y+c*x+d*y+e-x.^2)

% verificam daca pleaca, daca e parabolica (vine si pleaca pentru
% totdeauna)
figure(2);
A=[y,ones(size(y))];
md =x.^2;
coef=A\md;
a=coef(1); 
e = coef(2);
disp([a,e]);

u=linspace(-2,2,40);
v=linspace(-3,0,40);
[X, Y]=meshgrid(u,v);  % produs cartezian intre u si v 

z=a*Y+ e-X.^2;
contour(X,Y,z,[0,0]); hold on
plot(x,y,'o');
erp= norm(a*y+e-x.^2)



