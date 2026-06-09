function [x, nIteratii] = rezolvaGaussSeidel2(A,b, eroare, nMaxIteratii)
	% rezolva iterativ sistemul A*x = b prin metoda Gauss-Seidel
	D = diag(diag(A));
	L = -tril(A,-1);
	U = -triu(A,1);
	% D== A-L-U;
	
	M = D - L;
	N = U;
	
	Minv = inv(M);
	
	T = Minv * N;
	c = Minv * b;
	
	nIteratii = 0;
	x1 = c;
	x2 = T*x1 + c;
	eroareT = (1-norm(T))/norm(T)*eroare;
	while norm(x2-x1)>eroareT
		x1 = x2;
		x2 = T*x1 + c;
		nIteratii = nIteratii+1;
		if (nIteratii > nMaxIteratii)
			error('Nu converge');
		end
	end 
	x = x2;
end