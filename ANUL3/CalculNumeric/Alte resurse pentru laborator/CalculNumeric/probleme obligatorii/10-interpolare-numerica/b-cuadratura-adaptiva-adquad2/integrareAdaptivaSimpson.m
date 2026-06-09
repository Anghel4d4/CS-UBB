function ret=integrareAdaptivaSimpson(f,a,b,m,tol)
	%fprintf('a=%g b=%g m=%d\n',a,b,m);
	delta=abs(integrareSimpson(f,a,b,m)-integrareSimpson(f,a,b,2*m));
	ret=0;
	if (delta<tol)
		ret=integrareSimpson(f,a,b,2*m);
	else
	   ret= integrareAdaptSimpson(f,a,(a+b)/2,m,tol)+ integrareAdaptSimpson(f,(a+b)/2,b,m,tol);
	end
end
