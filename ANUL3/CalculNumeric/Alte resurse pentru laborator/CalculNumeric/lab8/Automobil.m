function a=Automobil(X,Y,dy,x)

Q=Hermite(X,Y,dy);
m = length(X)*2;
s = 0;
prod = 1;
for i=1:m
    j = 2*i;
    x(j-1) = X(i);
    x(j) = X(i);
end
for i=1:2*m
  s = s + Q(1,i) * prod;
  prod = prod*(x - x(i));
end
a= s;
end