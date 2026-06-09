function x = rezolvaJacobi(A,b, eroare)
	D = diag(diag(A));
	L = -tril(A,-1);
	U = -triu(A,1);      %D=A+L+U
	M = D;
	N = L + U;           %Minv = inv(M);
	                     %mai eficient in acest caz particular: Minv = diag(1./diag(A));
	
	T = inv(D)*(L+U);
	c = inv(D) * b;
	
	nIteratii = 0;
	x1 = b;
	x2 = T*x1 + c;
	while (norm(x2-x1)>(1-norm(T))/norm(T)*eroare) && (eroare<=0.0005)
		x1 = x2;
		x2 = T*x1 + c;
		nIteratii = nIteratii+1;
        % numarul de iteratii necesar pentru a concluziona ca metoda
        % iterativa converge depinde de sistem, dar in mod obisnuit
        % alegem 100. Deoarece matricea A nu este strict diagonal dominanta
        % avem nevoie de mult mai multe iteratii
		if (nIteratii > 390) %conditia de oprire
			error('Nu converge');
		end
	end 
	x = x1;
end