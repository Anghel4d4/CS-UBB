%Calculati inversa unei matrice date rezolvand un set de sisteme convenabile si utilizand descompunerea LUP.

function B=invlup(A)
[L,U,P]=lu(A);
[n,m]=size(A);
if n~=m
    error('A nu e o matrice patratica')
end
B=zeros(n);
I=eye(n);
for i=1:n
    z=L\(P*I(:,i));
    b=U\z;
    B(:,i)=b;
end

    
    
    