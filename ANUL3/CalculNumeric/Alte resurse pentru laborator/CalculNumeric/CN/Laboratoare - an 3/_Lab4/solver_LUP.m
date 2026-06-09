function x = rezolvaLUP(A, b)
    [n, m] = size(A);
	if n~=m
		error('Matricea nu este patratica')
	end
    [L, U, P] = descLUP(A);
    b = P*b;
    y = zeros(n, 1);
    y(1) = b(1)/L(1,1);
    for i=2:n
       y(i)= (b(i) - L(i, 1:i-1)*y(1:i-1))/L(i,i);
    end
    
    x = zeros(n, 1);
    x(n) = y(n)/U(n,n);
    for i=n-1:-1:1
       x(i)= (y(i) - U(i, i+1:n)*x(i+1:n))/U(i,i);
    end
    