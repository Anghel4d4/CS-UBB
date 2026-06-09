function x=Newton(f,fd,x0,eAbs,eRel,nrIteratii)
%metoda lui Newton 
%f - functia
%fd - derivata
%x0 - valoarea de pornire
%eAbs - eroarea absoluta
%eRel - eroarea 
%Nmax - numar maxim de iteratii
%nrIteratii - numar de iteratii

x=[x0,zeros(1,nrIteratii)];
for k=1:nrIteratii
    x(k+1)=x(k)-f(x(k))/fd(x(k)); 
	if abs(x(k+1)-x(k))<eAbs+eRel*x(k+1) %daca e adevarat => am gasit solutia => sfarsit
     		return
    end
end
fprintf('S-a depasit numarul de iteratii');

