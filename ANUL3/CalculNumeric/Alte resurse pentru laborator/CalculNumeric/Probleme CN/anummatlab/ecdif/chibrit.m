delta=0.01;
F = inline('y^2-y^3','t','y');
opts = odeset('RelTol',1e-4);
ode45(F,[0,2/delta],delta,opts);