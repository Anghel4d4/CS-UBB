clc;
%Punctul a)
fprintf('Punctul a\n');
%a = coeficientiPolinom(20);
% functia poly (din matlab):
a = poly(1:20);

r = roots(a);
a1 = a + normrnd(0, 1e-10);
r1 = roots(a1);
norm(r1-r)/norm(a1-a)

a2 = a + unifrnd(-1e-10, 1e-10);
r2 = roots(a2);
norm(r2-r)/norm(a2-a)

%Punctul b)
fprintf('Punctul b\n');

a = 2.^[-19:0];
b=[1,a];
r = roots(b);

ss= polyval(abs(a), (r)) 

au = diff(ss)

x=[20:1];

sss= polyval(x, b)










