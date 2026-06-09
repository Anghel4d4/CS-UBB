function yi = splineHermite(nn, xn, fn, dn, x)
  %datele sunt transformate in vectori coloana
  xn = xn ( : );
  fn = fn ( : );
  dn = dn ( : );
  x = x ( : );
  % setam +/- infinit
  xn2 = [ -Inf; xn(1:nn); +Inf ];
  % returneaza in i1 indexul xn2 a.i. xn2(i1(i)) <= x(i) <= xn2(i1(i)+1)
  [ ~, i1 ] = histc ( x, xn2 );
  % tot e e in intervalul (-inf,xn(1)) ajunge in (xn(1),xn(2))
  k =  i1 == 1 ;
  i1(k) = 2;
  % tot e e in intervalul (xn(nn),+inf) ajunge in (xn(nn-1),xn(nn))
  k =  i1 == nn + 1 ;
  i1(k) = nn;
  % indexare parte dreapta si eliminare -inf
  i1 = i1 - 1;
  i2 = i1 + 1;
  % evaluare polinom
  yi = hermiteCubicValue ( xn(i1), fn(i1), dn(i1), ...
                                         xn(i2), fn(i2), dn(i2), x );

function yy = hermiteCubicValue ( x1, f1, d1, x2, f2, d2, x )
  h =    x2 - x1;
  df = ( f2 - f1 ) ./ h;

  c2 = - ( 2.0 * d1 - 3.0 * df + d2 ) ./ h;
  c3 =   (       d1 - 2.0 * df + d2 ) ./ h ./ h;

  dx = x - x1;
  yy = f1 + dx .* ( d1 + dx .* ( c2 + dx .*c3 ) );

  return