function [yi, xi, noduriCebisev2] = interpLagrangeNoduriCebasev2(nNoduri, f, ni)
   alpha = zeros(1, nNoduri);
   beta = 1/4 * ones(1,nNoduri - 1); %n-1 elements
   
   J = diag(alpha) + diag(sqrt(beta), 1) + diag(sqrt(beta), -1);
   x = eig(J); % nodurile sunt valorile proprii ale matricii J.
   x = x';
   noduriCebisev2 = x;
   y = f(x);
   xi = linspace(x(1), x(length(x)), ni);
   
   yi = interp2(x, y, xi);
end