
[x,y]=ginput();
n=length(x);
tn = 0:n-1;
t= linspace(0, n-1, 3000);

[a1,b1, c1, d1] =Splinecubic(tn, x, 3);
[a2,b2, c2, d2] =Splinecubic(tn, y, 3);

vx=evalspline(tn,a1,b1,c1,d1,t);
vy=evalspline(tn,a2,b2,c2,d2,t);
plot(x,y,'+', vx, vy);


[a3,b3, c3, d3] =Splinecubic(tn, x, 2);
[a4,b4, c4, d4] =Splinecubic(tn, y, 2);

vx2=evalspline(tn,a3,b3,c3,d3,t);
vy2=evalspline(tn,a4,b4,c4,d4,t);
figure();
plot(x,y,'+', vx2, vy2);