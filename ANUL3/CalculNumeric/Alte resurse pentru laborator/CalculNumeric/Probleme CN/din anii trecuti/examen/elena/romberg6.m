function I=romberg(f,a,b,epsilon,nmax)
%ROMBERG - calculul aproximativ al unei integrale 
%prin metoda lui Romberg
%f -functia
%a,b - limitele de integrare
%epsilon - eroarea
%nmax - numar maxim de iteratii
%if nmax < 4
 % epsilon=1e-3;
%end

if nmax < 5
  nmax=10;
end

R=zeros(nmax,nmax);
h=b-a;
% prima iteratie
R(1,1)=h/2*(sum(f([a,b])));
for k=2:nmax
   %formula trapezelor;
   x=a+([1:2^(k-2)]-0.5)*h;
   R(k,1)=0.5*(R(k-1,1)+h*sum(f(x)));
   %extrapolare
   plj=4;
   for j=2:k
      R(k,j)=(plj*R(k,j-1)-R(k-1,j-1))/(plj-1);
      plj=plj*4;
   end
   if (abs(R(k,k)-R(k-1,k-1))<epsilon)&(k>3)
      I=R(k,k);
      return
   end
   %dublare noduri
   h=h/2;
end
error('prea multe iteratii')
