function x=rezolvaGauss(A,b)
%rezolva sistemul A*x=b prin metoda eliminarii Gauss cu pivotare pe liniei
[n, m]=size(A);
A=[A, b];%constuim matricea extinsa
if(n~=m)
    error('Matricea nu e patratica')
end
x=zeros(n,1);
%7:Ep <-> Ei - interschimba linia p cu linia i
%A([p,i],:)=A([i,p],:) -> interschimba liniile i si p din A MATLAB
%10:mji = Aji/Aii
%11:(Ej-mjiEi)->Ej
%mji = A(j,i)/A(i,i) MATLAB
%A(j,:)=A(j,:)-mji*A(i,:) MATLAB
for i = 1:n-1
    p=i;
    while A(p, i) == 0 && p<n
        p=p+1;
    end
    if(A(p, i) == 0)
        error('nu exista solutie unica');
    end
    if (p ~= i)
        A([p,i],:)=A([i,p],:);
    end
    for j = i+1:n
        mji = A(j,i)/A(i,i);
        A(j,:)=A(j,:)-mji*A(i,:);
    end
end
if A(m,n) == 0
    error('Nu exista solutie unica');
end
x(n) = A(n, n+1)/A(n,n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum +A(i, j)*x(j);
    end
    x(i) = (A(i,n+1)-sum)/A(i,i);
end
% (aij, aii+1, aii+2....ain) * vectorul coloana (xi+1, xi+2....xn)va
% rezulta suma ==> x(i) = (A(i, n+1)-A(i, i+1:n)*x(i+1:n))/A(i,i);
    
