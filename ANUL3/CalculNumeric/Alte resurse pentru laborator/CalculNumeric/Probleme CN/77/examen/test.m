function test()
x = 0:pi/6:2*pi;
f = sin(x);
t = 0:0.05:2*pi;
der = [0, 0];   %derivatele de ordin 2 in a=0 si b=2pi 
                %[-sin(0), -sin(2*pi)]

eval_si_grafic(x, f, der, t);
