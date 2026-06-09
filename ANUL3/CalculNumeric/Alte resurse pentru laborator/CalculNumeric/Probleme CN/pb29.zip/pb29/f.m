function [y] = f(x,Re)
% f = expresia functiei asociate ecuatiei pentru curgerea turbulenta
% a unui fluid printr-o conducta neteda

y = x*[-0.4 + 1.74 * log(Re * x) ]-1;