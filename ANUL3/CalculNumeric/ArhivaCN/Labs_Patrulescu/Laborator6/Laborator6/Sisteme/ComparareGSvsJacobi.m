function ComparareGSvsJacobi
%functie care compara metoda GaussSeidel cu metoda Jacobi

clc
clear all 
close all

tipex='ex2';

epsilonvect=10.^(-1:-1:-15);
le=length(epsilonvect);

countJv=zeros(1,le);
countGSv=zeros(1,le);



n=100;%dimensiunea sistemului
Nr_it=1000; % numarul maxim de iteratii si limita pt conditia de stop
[A,b,solexact]=DateSistem(n,tipex);

fprintf('Numarul de iteratii atunci cand limita de stop variaza\n')
fprintf('Epsilon\t\t\t\tJacobi\t\t\t Gauss-Seidel\n')
for k=1:le
 epsilon=epsilonvect(k);
 [xJv,countJv(k)]=JacobiVectorizat(A,b,Nr_it,epsilon);
[xGSv,countGSv(k)]=GaussSeidelVectorizat(A,b,Nr_it,epsilon);
 fprintf('%e\t\t\t%d\t\t\t\t\t%d\n',epsilon,countJv(k),countGSv(k))

end

figure(1)
hold on 
box on
plot(1:le,countJv,'b')
plot(1:le,countGSv,'r')





