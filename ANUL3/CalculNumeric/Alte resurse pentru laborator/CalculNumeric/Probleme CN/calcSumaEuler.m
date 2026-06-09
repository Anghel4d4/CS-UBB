function e = calcSumaEuler(n)
% Calculeaza o aproximare a numarului Euler folosind
% primii n termeni a seriei infinite
	e = 1;
	for i = 1:n-1
		e = e + 1/factorial(i);
	end
end
