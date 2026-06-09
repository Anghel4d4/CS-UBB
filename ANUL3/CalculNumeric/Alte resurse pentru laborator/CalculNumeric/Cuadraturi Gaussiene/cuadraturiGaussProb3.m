% eig - returneaza 2 matrici: v si d
% V - vectori proprii
% D - valori proprii pe diagonala
function Q = cuadraturiGaussProb3(n)
  alfaa=zeros(1,n);
  betaa=[sqrt(pi),(1/2)*(1:n-1)];
  H=diag(alfaa,0)+diag(sqrt(betaa(2:end)),1)+ diag(sqrt(betaa(2:end)),-1);
  [V,D]= eig(H);
  t=diag(D,0);
  w=betaa(1)*V(1,:).^2;
  f=@(x)cos(x);
  Q=w*f(t);
end