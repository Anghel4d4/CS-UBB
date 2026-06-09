% eig - returneaza 2 matrici -> v, d
% V - vectori proprii
% D - valori proprii pe diagonala
function Q = cuadraturiGauss(n)
  alfaa=zeros(1,n);
  betaa=[2,(4-[1:n-1].^-2).^-1];
  J= diag(alfaa,0)+diag(sqrt(betaa(2:end)),1)+ diag(sqrt(betaa(2:end)),-1);
  [V,D]=eig(J);
  t=diag(D,0);
  w=betaa(1)*V(1,:).^2;
  f=@(x)sin(x.^2);
  Q=w*f(t);
end