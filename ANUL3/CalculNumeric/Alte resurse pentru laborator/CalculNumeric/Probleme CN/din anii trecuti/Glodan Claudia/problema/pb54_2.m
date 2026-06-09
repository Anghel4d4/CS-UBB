%P54.2
%Glodan Claudia gr. 232
clear;
% construiesc obiecte simbolice
syms x f u
%functia f
f=2./(1+x.^2);
%integram fnctia cu int pentru a afisa valoarea
u=int(f,-1,1)
%valoare
valoare=double(u)
clear x

%aproximam integrala print quadraturi adaptive 
ff=@(x) 2./(1+x.^2);

adquad(ff,-1,1); % toleranta in calcului adquad se ia implicit 1.e-6

prec=[];   %vector de precizii obtinute precizia
nreval=[]; %vector cu nr. de evaluari
toleranta=[]; %vector de tolerante

%apelez adquad pentru diferite tolerante, de la 10 la puterea -1 pana la 10
%la puterea -15
for tol=-1:-1:-15
    [I,nev]=adquad(ff,-1,1,10^tol);
    toleranta=[toleranta;abs(tol)];
    er=abs(I-pi)/pi;
    pr=er.^(-1);
    prec=[prec;pr];
    nreval=[nreval;nev];
end

subplot(2,1,1)
plot(toleranta,nreval,'d-');
title('numar de evaluari')
xlabel('toleranta(10^{-k})')
ylabel('nr. evaluari')
title('variatia numarului de evaluari in functie de toleranta','FontSize',14);
subplot(2,1,2)
semilogy(toleranta,prec,'x-')
title('precizia')
xlabel('toleranta(10^{-k})')
ylabel('precizia')
title('variatia preciziei in functie de toleranta','FontSize',14);