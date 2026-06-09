function y=fs3(x)
g=9.81;
y=[x(1)*cos(x(2))*x(3)-300
    -1/2*g*x(3)^2+x(1)*sin(x(2))*x(3)-61
    -g*x(3)+x(1)*sin(x(2))-x(1)*cos(x(2))];