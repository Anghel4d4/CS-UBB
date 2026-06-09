function x=rezolvaGssSimVector(v,b,n)
%rezolva sistemul A*x=b prin metoda Gauss daca A este simetrica
%matricea A este stocata in vectorul v

x=zeros(n,1);
for i=1:n-1
	%if A(i,i)== 0
	if v(i*(i-1)/2 + i) == 0
		error('Nu exista solutie unica');
	end

    for j = i+1: n
        %mji=A(j,i)/A(i,i);
		mji = v(j*(j-1)/2 + i)/v(i*(i-1)/2 + i);
		
		%A(j:n,j)=A(j:n,j)-mji*A(j:n,i);
		v((j:n).*(j-1:n-1)/2 + j) = v((j:n).*(j-1:n-1)/2 + j) - mji* v((j:n).*(j-1:n-1)/2 + i);
				
		b(j) = b(j) - mji*b(i);
    end
end

%if A(n,n)== 0
if v(n*(n-1)/2 + n) == 0
	error('Nu exista solutie unica');
end

%x(n) = b(n)/A(n,n);
x(n) = b(n)/v(n*(n-1)/2 + n);
for i=n-1:-1:1
    %x(i)=(b(i)-A(i+1:n,i)'*x(i+1:n))/A(i,i);
	x(i) = (b(i) - v((i+1:n).*(i:n-1)/2 + i)*x(i+1:n))/v(i*(i-1)/2 + i);
end




