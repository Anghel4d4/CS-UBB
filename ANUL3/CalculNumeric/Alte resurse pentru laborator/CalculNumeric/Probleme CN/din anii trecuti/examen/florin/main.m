% functia f
syms x
f = @(x) sin(x);	

% evaluarea functiei phi pentru diferiti parametri
aproximarePhi(0, 0.999)
aproximarePhi(1, 0.99999)
aproximarePhi(-5, 0.99999)
aproximarePhi(10, 1.00001)
