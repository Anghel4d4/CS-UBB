% Q = divdif(0:3,exp(0:3))

% N = newton(0:3,exp(0:3), 2.5);

% N = divdif2(0:3,exp(0:3), exp(0:3));

% [N,dN] = hermit(0:3,exp(0:3),exp(0:3), 2.5)

%problema cu mersul

t = [0 3 5 8 13];
d = [0 225 383 623 993];
v = [75 77 80 74 72];

%la ora 12 a avut respectiva dN viteza si N km parcursi
[N,dN] = hermit(t, d, v, 12)


