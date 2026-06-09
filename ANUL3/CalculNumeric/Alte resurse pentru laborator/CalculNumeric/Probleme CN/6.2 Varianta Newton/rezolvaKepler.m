function val=rezolvaKepler(e,n,x0,eAbs,eRel,nrIteratii)

%x0 - valoarea de pornire
%eAbs - eroarea absoluta
%eRel - eroarea 
%Nmax - numar maxim de iteratii
%nrIteratii - numar de iteratii

if(abs(e)>=1)
    error('Introdu Epsilon in intervalul (-1,1)');
end

if (nargin<6) 
    nrIteratii=20; 
end
if (nargin<5) 
    eRel=1e-6; 
end
if (nargin<4) 
    eAbs=1e-6; 
end

a=strcat('x-',num2str(e),'*sin(x)-',num2str(n)); %construiesc functia f ( concatenare de stringuri )
b=strcat('1+',num2str(e),'*cos(x)'); %construiesc functia fd ( concatenare de stringuri )

f=inline(a);
fd=inline(b);

x=Newton(f,fd,x0,eAbs,eRel,nrIteratii);

i=1;
while(x(i)~=0)
    i=i+1;
end
val=x(i-1);