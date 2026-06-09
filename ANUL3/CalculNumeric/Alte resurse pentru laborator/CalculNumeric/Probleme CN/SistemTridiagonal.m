
% Rezolva sistemul liniar G*G’x = b unde b este un vector de dimensiune n si G este o
% matricea bidiagonala inferioara nesingulara. 
% g si h vectori de dimensiune n cu proprietatea
% G = diag(g) + diag(h(2:n),-1).

function x = SistemTridiagonal(g,h,b)
n = length(g);
y = zeros(n,1);
% Gy = b
y(1) = b(1)/g(1);
for k=2:n
	y(k) = (b(k) - h(k)*y(k-1))/g(k);
end
% G’x = y
x = zeros(n,1);
x(n) = y(n)/g(n);
for k=n-1:-1:1
	x(k) = (y(k) - h(k+1)*x(k+1))/g(k);
end