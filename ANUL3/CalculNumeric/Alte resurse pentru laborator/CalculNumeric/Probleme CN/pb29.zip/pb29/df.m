function [y] = df(x,Re)
% derivata functiei asociate ecuatiei pentru curgerea turbulenta
% a unui fluid printr-o conducta neteda

y=1.34+1.74*log(Re)+1.74*log(x);