[Q,fcount] = adquad('exp(x.^2)',-0.25,0.25,0.001)
f = @(x) exp(x.^2);

integral(f,-0.25,0.25)