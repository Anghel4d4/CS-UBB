%ck*pi indice(k+1) (x) = ak*x*pi indice(k)(x)+bk*pi indice(k-1)(x)
%pi indice 0(x)=1 (pi indice -1 (x) = 0)
x= linspace(-1, 1, 100);
for k=1:8
    a = (1:k)+1; % ak = k+1
    b=2*(1:k)+1; % bk=2*k+1
    c=-(1:k);    % ck=-k
    cp= coefOrto(a, b, c);
    y=polyval(cp, x);
    plot(x, y)
    holdon % toate ploturile din for se adauga in aceeasi fereastra
end