function yprime=chem(t,y,alpha,beta,gamma)
%CHEM - modelul lui Robertson pentru reactii chimice

yprime = [-alpha*y(1)+beta*y(2)*y(3);
    alpha*y(1)-beta*y(2)*y(3)-gamma*y(2)^2;
    gamma*y(2)^2];