function SistemeLiniare
%functie care analizeaza diverse metode numerice pentru rezolvarea
%sistemelor liniare

clc
clear all 
close all

n=550;


tic
[A,b,solexact]=DateSistem(n);
timpexdatsist=toc;
fprintf('S-a executat functia DateSistem Timp=%s\n',num2str(timpexdatsist))


%Rezolvarea sistemului folosind implementarea din MATLAB
tic
x=A\b;
timpexMATLAB=toc;
fprintf('S-a exacutat implementarea MATLAB Timp=%s\n',num2str(timpexMATLAB))

%Rezolvarea sistemului folosind metoda elimiarii Gauss cu pivot partial
tic
xg=ElimGaussPivPartial(A,b);
timpexEGpivp=toc;
fprintf('S-a exacutat implementarea prin  Eliminare-Gauss cu pivot partial Timp=%s\n',num2str(timpexEGpivp))

tic
Nr_it=1000; epsilon=10^(-15);
[xJ,countJ]=Jacobi(A,b,Nr_it,epsilon);
timpJac=toc;
fprintf('S-a executat implemetarea Jacobi Timp=%s Iteratii %d\n',num2str(timpJac),countJ)

tic
Nr_it=1000; epsilon=10^(-15);
[xJv,countJv]=JacobiVectorizat(A,b,Nr_it,epsilon);
timpJacv=toc;
fprintf('S-a executat implemetarea Jacobi vectorizat Timp=%s Iteratii %d\n',num2str(timpJacv),countJv)



%Calculul erorilor
Eram=norm(x-solexact);
Erag=norm(xg'-solexact);
Eraj=norm(xJ-solexact);
Erajv=norm(xJv-solexact);



fprintf('\n')
fprintf('ERORILE ABSOLUTE IN NORMA 2 \n')
fprintf('Eroarea pentru implementarea Matlab %.20f\t %.5f\n',Eram,log10(Eram))
fprintf('Eroarea pentru implementarea Eliminare-Gauss pivot partial  %.20f %.5f\n',Erag,log10(Erag))
fprintf('Eroarea pentru implementarea Jacobi %.20f %.5f\n',Eraj,log10(Eraj))
fprintf('Eroarea pentru implementarea Jacobi vectorizat %.20f %.5f\n',Erajv,log10(Erajv))


