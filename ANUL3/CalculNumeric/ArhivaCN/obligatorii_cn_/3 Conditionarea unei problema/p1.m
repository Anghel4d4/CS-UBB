A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
b = [32; 23; 33; 31];
bp= [32.1 ; 22.9; 33.1; 30.9];  %b perturbat

x=A\b;
xp=A\bp;
eri=norm(b-bp)/norm(b);       
% err relativa la intrare

ero=norm(x-xp)/norm(x);
% err relativa la iesire

co=ero/eri;
% factor de amplificare (conditionare)

% condionare automata - e pesimista
cond(A);

%!!! daca afisam x si xp observam ca e puternic perturbat

%hilberg
hilb(4)
invhilb(4)
for n=10:10:100
    co = max(eig(hilb(n)))*max(eig(invhilb(n)));
    %es=(1+sqrt(2))^(4n+1)/2^(15.n)*sqrt(pi*n)
end

% vandermont
for n=10:15
    %t=linspace(-1,1,n);
    t=1./(1:n)
    cond(vander(t),inf)
end

