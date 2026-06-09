function c = coeffChebyshev(f, n)
%COEFFCHEBYSHEV - coeficienti Cebisev
%apel C=COEFFCHEBYSHEV(F,N)
%F - functia
%N - gradul
%C - coeficientii

for k=0:n
    c(k + 1) = 2 / pi * quadl(@fceb, 0, pi, 1e-12, 0, f, k);
end
%subfunctie
function y = fceb(x, f, k)
    y = cos(k * x) .* feval(f, cos(x));