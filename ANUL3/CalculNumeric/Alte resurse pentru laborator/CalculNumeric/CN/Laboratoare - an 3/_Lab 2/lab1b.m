%Chebyshev
function T=lab1b(n,x)
if n == 0
    T = ones(1, length(x));
    return;
end
if n==1
    T = x;
    return
end
    T = 2*x.*lab1b(n-1,x) - lab1b(n-2,x);
end