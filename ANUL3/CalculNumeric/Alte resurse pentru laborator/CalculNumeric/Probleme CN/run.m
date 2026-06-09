clc;
f = @(z)(1-cos(pi/10))/(cos(pi/10)-cos(z))*(sin(z)/z)
fderivat=@(z) -((1-cos(pi/10)*sin(z))^2)/(z*(cos(pi/10)-cos(z)))^2-(1-cos(pi/10)*sin(z))/(z^2*(cos(pi/10)-cos(z)))+(1-cos(pi/10)*cos(z))/(z*cos(pi/10)-cos(z))
ezplot(f)

H = 0.075;
h0 = 1/180; 
[rez,nIt] = metNewton(f,fderivat,h0,1e-6,1e-5,20000);
% afisam valoarea lui h
disp(abs(rez))
