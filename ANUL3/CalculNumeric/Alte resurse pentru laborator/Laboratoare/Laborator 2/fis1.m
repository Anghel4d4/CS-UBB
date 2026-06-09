format hex
1
-1
2
3
4
pi

format long
x=1+1e-16
x=1+1e-15
eps(x)
pi+eps(pi)

format hex
realmax

format long
realmax
2*realmax

Inf-Inf
sqrt(-5)
log(-2)

format long
realmin

x=realmin
x/2
x/4
realmin*eps

format long
[f,e]=log2(x)
x=pow2(f,e)

x=4/3-1;
y=3*x;
e=1-y;
