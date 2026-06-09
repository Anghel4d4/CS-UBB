function ComparareGSvsJacobivsRelaxare
%functie care compara metoda GaussSeidel cu metoda Jacobi

clc
clear all 
close all

tipex='ex2';

epsilonvect=10.^(-1:-1:-15);
le=length(epsilonvect);

%initializarea numarului de iteratii pentru fiecare metoda
countJv=zeros(1,le);
countGSv=zeros(1,le);
countSORv=zeros(1,le);

n=10;%dimensiunea sistemului
Nr_it=1000; % numarul maxim de iteratii si limita pt conditia de stop
[A,b,solexact]=DateSistem(n,tipex);
A

omega=DetOmegaOpt(A);

fprintf('Numarul de iteratii atunci cand limita de stop variaza\n')
fprintf('Epsilon\t\t\t\tJacobi\t\t\t Gauss-Seidel\t\tSOR\n')
for k=1:le
 epsilon=epsilonvect(k);
 [xJv,countJv(k)]=JacobiVectorizat(A,b,Nr_it,epsilon);
 [xGSv,countGSv(k)]=GaussSeidelVectorizat(A,b,Nr_it,epsilon);
  if (omega<=0)||(omega>=2)
      countSORv(k)=0;
  else
    [xSORv,countSORv(k)]=SORvectorizat(A,b,omega,Nr_it,epsilon);
  end
 fprintf('%e\t\t\t%d\t\t\t\t\t%d\t\t\t%d\n',epsilon,countJv(k),countGSv(k),countSORv(k))

end

figure(1)
hold on 
box on
plot(1:le,countJv,'b*')
plot(1:le,countGSv,'ro')
plot(1:le,countSORv,'gs')
legend('Jacobi','Gauss-Seidel', 'SOR(omega)')
ylabel('Numar de iteratii')
xlabel('$\varepsilon$','Interpreter','Latex','FontSize',24)



