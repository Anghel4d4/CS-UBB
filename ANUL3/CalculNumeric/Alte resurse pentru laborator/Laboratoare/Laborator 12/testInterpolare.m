% :[0,2*pi]->R
% f(x)=sin(sqrt(101*x)) + cos(sqrt(37*x))
% xk - Cebisev de speta a doua
% m=10 (11 noduri)
% metoda baricentrica (PIL)
% forma Netwon (PIL)
% polinomul de interpolare hermite cu noduri duble
% spline cubic
% metoda celor mai mici pătrate (8 noduri)

function testInterpolare()
  
  f = @(x) sin(sqrt(101).*x).+cos(sqrt(37).*x);

  m=10;
  k=0:m;

  % CEBISEV
  x = cos(k*pi/m);
  tk = (2*pi*x+2*pi)/2;

  ft = f(tk);

  ta=linspace(0,2*pi,500);
  fta=f(ta);

  % BARICENTRICA
  B = metBaricentrica(tk,ft,ta);
  figure(1)
  plot(tk,ft,'o',ta,B,'-.',ta, fta);
  title('BARICENTRICA');

  % NEWTON
  td = DifDivizate(tk,ft);
  N = metNewton(tk,ta,td);

  figure(2)
  plot(tk,ft,'o',ta,N,'-.',ta, fta);
  title('NEWTON');

  % HERMIT
  f1 = sqrt(101).*cos(sqrt(101).*x).-sqrt(37).*sin(sqrt(37).*x);
  hnf = @(x) hermite(x,tk,ft,f1);
  x=linspace(0,2*pi);
  figure(3)
  plot(tk,ft,'o',ta,N,'-.',ta, fta);
  %plot(x,f,x,hnf(x));
  title('HERMIT');

end