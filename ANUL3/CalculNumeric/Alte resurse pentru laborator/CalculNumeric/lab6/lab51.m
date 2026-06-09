function x= lab51(a, b, nr)

  d=diag(diag(a));
  dim = size(a, 1);
  x = zeros(dim,1);
  L = d - tril(a);
  U = d - triu(a);
  N = L + U;
  T = inv(d) * N;
  c = inv(d) * b;
  for i=1:nr
     x = T * x + c;
  end
end