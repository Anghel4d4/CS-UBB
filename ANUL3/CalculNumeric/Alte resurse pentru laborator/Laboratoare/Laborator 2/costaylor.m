function s=costaylor(x)
  s=0;
  t=x;
  n=1;
  
  ;t=1;
  
  while s+t~=s
    s=s+t;
    t=-x^2/(n*(n+1))*t;
    n=n+2;
  end
end
  