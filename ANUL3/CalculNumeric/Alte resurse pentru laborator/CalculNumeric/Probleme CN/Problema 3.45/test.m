clc 
%punctul a
x=[1.02 .95 .87 .77 .67 .56 .44 .30 .16 .01]';
y=[0.39 .32 .27 .22 .18 .15 .13 .12 .13 .15]';

grafic(x,y)

%punctul b
x = x + unifrnd(-5e-3*ones(10,1),5e-5*ones(10,1));
y = y + unifrnd(-5e-3*ones(10,1),5e-5*ones(10,1));

grafic(x,y)
