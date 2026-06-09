%Scrieti un program MATLAB care calculeaza numarul de conditionare al 
%matricei Hilbert Hn in norma euclidiana
clc
n=4;
H=zeros(n);

for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);
    end
end

fprintf('matricea Hilbert este: \n\r')
disp(H)

%definim matrice de zerouri care va fi inversa matricei Hilbert 
inversa=zeros(4);
for i=1:n
    for j=1:n
        %inversa(i:j)= (-1)^(i+j)*(i+j-1)*(n+i-1:n-j)*(n+j-1:n-1)*(i+j-2:i-1)^2
        inversa(i,j)=(-1).^(i+j)*(i+j-1)*nchoosek(n+i-1,n-j)*nchoosek(n+j-1,n-i)*nchoosek(i+j-2,i-1).^2;
    end
end

fprintf('inversa este: ')
disp(inversa)

%disp(invhilb(4)) - am calculat inversa matricii Hilbert folosind si
%functia invhilb din Mathlab pentru a ma aigura ca rezultatele sunt corecte

%eig(H) valoare proprie a lui H
%eig(inversa) - valoarea proprie a inversei lui H

Cond=max(eig(H))*max(eig(inversa))