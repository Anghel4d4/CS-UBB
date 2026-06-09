function testIntAdap()
% incercam diferite valori pentru n si toleranta 
fprintf('\n---------------------------------------------\n');
fprintf('-----n=2,tol=1E-12-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,2,1E-12)
fprintf('-----n=2,tol=1E-6-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,2,1E-6)
fprintf('-----n=2,tol=1E-5-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,2,1E-5)
fprintf('-----n=2,tol=1E-3-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,2,1E-3)
fprintf('-----n=2,tol=1E-2-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,2,1E-2)
fprintf('-----n=3,tol=1E-3-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,3,1E-3)
fprintf('-----n=3,tol=1E-1-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,3,1E-1)
fprintf('-----n=6,tol=1E-1-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,6,1E-1)
fprintf('-----n=10,tol=1E-10-----');
integradaptTrapeze(@(x) x^4*(1-x)^4/(1+x^2),0,1,10,1E-10)
fprintf('-----------------------------------------------------\n');
%pare sa fie o aproximare buna