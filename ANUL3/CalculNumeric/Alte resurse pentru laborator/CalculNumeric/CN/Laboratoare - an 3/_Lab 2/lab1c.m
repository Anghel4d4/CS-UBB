%Taylor
function T=lab1c(n,x)
T = 1;
for i=1:n
    T = T + 1/factorial(i) * x^i;
end
