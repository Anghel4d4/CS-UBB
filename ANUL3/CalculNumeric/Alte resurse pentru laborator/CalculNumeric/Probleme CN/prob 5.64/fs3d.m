function y=fs3d(x)
g=9.81;
y=[cos(x(2))*x(3) -x(1)*sin(x(2))*x(3) x(1)*cos(x(2))
    sin(x(2))*x(3) sin(x(2))*x(3) -g*x(3)
    sin(x(2))-cos(x(2)) x(1)*cos(x(2))+x(1)*sin(x(2)) -g];