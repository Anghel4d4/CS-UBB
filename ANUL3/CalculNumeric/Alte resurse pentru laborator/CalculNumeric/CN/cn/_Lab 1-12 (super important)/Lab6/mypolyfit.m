function c=mypolyfit(x,y,n)
%gaeste coeficientii polinomului 
%care aproximeaza datele x,y in sensul celor mai mici patrate

% c rezulta din rez sist liniar A*c=b unde Aij=suma de la k=1 pana la
% m din xk la (n-i+1) * xk la (n-j+1) (i de la 1 la n+1 si j de la 1 la n+1)
%bi este suma de la k = 1 pana la m din yk * (xk la (n-i+1)) (i de la 1 la n+1)
%transpusa : V->V'
%suma o calculam cu vector linie * vector coloana
m=length(x);
if m~= length(y)
    error('x si y nu au aceeasi lungime')
end
A=zeros(n+1);
b = zeros(n+1,1);
for i=1:n+1
    for j=1:n+1
        A(i,j) = x.^(n-i+1)*(x.^(n-j+1))';
    end
     b(i) = y*(x.^(n-i+1))';
end
c=A\b;
c=c';