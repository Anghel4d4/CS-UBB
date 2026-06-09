%Acest fisier practic este practic rezolvarea punctului (c) al problemei 34
%Vom utiliza functia definita anterior (la punctul (b) ) denumite iter(g,z0,eps) 
%	pentru a gasi o radicina reala a ecuatiei x^3-x-1=0. Valoarea va fi returnata de functie si afisata cu disp() 

	g=@(x)(x^3-1);
	disp(iter(g,-1,1E-6));