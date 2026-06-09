function [A] = jacobian(x)

A = zeros(2);
%valori incorecte - trebuie calculata matricea jacobiana
A(1, 1) = 2 * x(1) +exp(x(1));
A(1, 2) = -2 * x(2) - sin(x(2));

A(2, 1) = 2 + exp(x(1));
A(2, 2) = 2 + cos(x(2));