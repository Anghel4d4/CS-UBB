function x = rezolvaJacobi(A, b, eroare)
	% rezolva iterativ sistemul A*x = b prin metoda Jacobi
	D = diag(diag(A));
	L = -tril(A,-1);
	U = -triu(A,1);

	Xinv = inv(D - L);
	
	T = Xinv * U;
	c = Xinv * b;
	
	nIteratii = 0;
	x1 = b;
	x2 = T*x1 + c;
	while norm(x2-x1,1)>(1-norm(T,1))/norm(T,1)*eroare
		x1 = x2;
		x2 = T*x1 + c;
		nIteratii = nIteratii+1;
		% if (nIteratii > 100)
		%	 error('Nu converge!');
		% end
	end 
	x = x1;
	disp(nIteratii);
end