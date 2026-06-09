% Daraban Cristian - Adrian 
% Prob. 2.28 b

clc
a = 1;
b = 10;
N = 10;

q = -16;
p = 8;
%r = 2*e^(4*xi);

h = b - a / N + 1 ;
mid = 2 - h^2*q;

for i = 2:N
    v_down_mid(i-1) = -1 + (-1)^i * h * p;
    %v_up_mid(i-1) = -1 - h * p;
end


v_mid(1:N) = mid;
v_up_mid(1) = -2;
v_up_mid(2:N-1) = -1 - h * p;

A = diag(v_mid) + diag(v_down_mid,-1) + diag(v_up_mid,1);

% mai trebuie sa declar f.. cum e in punctul a 
