N = 1001;
h = 1/(N-1);
x = 0:h:1;
n = N-2;

b = h^2*f(x(2:N-1)');
d = 2*ones(1,n);
e = -ones(1,n);

[g,h] = SistemTridiagonalCholesky(d,e);
y = SistemTridiagonal(g,h,b);
y = [0; y; 0];

plot(x,y)

