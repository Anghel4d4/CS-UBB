function rez = aproximarePhi(theta, r)
% aproximeaza potentialul in interiorul cercului unitate
% datorat unui potential dat pe frontiera
% f - functia

% evaluam pentru f(theta) = sin(theta);
simTheta = sin(theta);

% functia de integrat
syms x
f = @(x) sin(x);
fun = @(x) (1 - r^2) * (f(x) - simTheta) / (1- 2*r * cos(theta-x) + r^2)*int((1 - r^2) * (f(x) - simTheta) / (1- 2*r * cos(theta-x) + r^2));

% aproximarea integralei
aprox = quad( int(fun(x), x, 0, 2*pi) );
phi = simTheta + aprox / (2*pi);
rez = phi;
