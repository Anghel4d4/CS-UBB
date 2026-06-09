f = @(x) sin(1./x);

integral(f,0.25,1)
% int = sumrectangles(-0.5,0.5,f,10)
% int = repetitivtrapez(-5,5,f,30)
% int = repetitivsimpson(-5,5,f,220)

int = adaptquad(0.25,1,f,4,0.00001);
[Q,fcount] = adquad('exp(x.^2)',-5,5,0.001)