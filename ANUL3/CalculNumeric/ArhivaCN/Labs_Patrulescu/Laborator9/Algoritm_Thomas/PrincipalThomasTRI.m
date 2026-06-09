clc
clear all
close all

n=6000
exact=ones(1,n);
r(1,1)=4; r(2:n-1,1)=3*ones(1,n-2); r(n,1)=4;%vectorul termenilor liber

%Algoritmul Thomas
a=5*ones(1,n);%vectorii pentru algoritmul Thomas
b=[-ones(1,n-1),0];
c=[0,-ones(1,n-1)];

tic 
xth=AlgThomas(a,b,c,r);
timpth=toc;
fprintf('Timpul de executie pentru algoritmul Thomas %.10f\n',timpth)
Eroareth=norm(exact-xth,'inf');
fprintf('Eroarea pentru algoritmul Thomas %.15f\n',Eroareth)
fprintf('\n\n')

%Metoda eliminarii lui Gauss si \ din Matlab
T=(diag(5*ones(1,n)))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);%matricea sistemului

tic
xeg=ElimGaussPivPartial(T,r);%solutia calculata folosind metoda eliminarii lui Gauss
timpeg=toc;
fprintf('Timpul de executie pentru metoda eliminarii lui Gauss %.10f\n',timpeg)
Eroareeg=norm(exact-xeg,'inf');
fprintf('Eroare pentru metoda eliminarii lui Gauss%.15f\n',Eroareeg)

fprintf('\n\n')
tic
xm=T\r;% solutia calculata  cu functia \ din Matlab;
timpm=toc;
fprintf('Timpul de executie pentru metoda mldivide din MATLAB %.10f\n',timpm)
Eroarem=norm(exact-xm','inf');
fprintf('Eroare pentru functia din MATLAB %.15f\n',Eroarem)