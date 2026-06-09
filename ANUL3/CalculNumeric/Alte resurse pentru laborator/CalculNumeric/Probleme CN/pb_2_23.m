%problema 2.23

A = zeros(2);
%sa luam spre exemplu matricea A de forma urmatoare:
%   1+i     1-i
%   1+2i    1-2i
A = [complex(1,1),complex(1,-1);complex(1,2),complex(1,-2)]

%verificam daca e nesingulara calculandu-i determinantul
det(A);
%daca determinantul e nenul, matricea e nesingulara. In cazul nostru
%det=-2i

AStelat=zeros(2);
Aconj=zeros(2);

%calculam conjugatul matricei
for i=1:2
   for j=1:2
       Aconj(i,j) =conj(A(i,j));
   end
end
disp(Aconj);

%calculam transpusa conjugata a matricei A si o salvam in AStelat
AStelat=Aconj';

%definim membrul stang al comparatiei
Stanga= inv([A,AStelat;-i*A,i*A]);
%definim membrul drept al comparatiei
Dreapta = 1/2*[inv(A),inv(A)*i;inv(AStelat),inv(AStelat)*(-i)];

%verificam daca cele doua matrici sunt egale
tf =isequal(Stanga,Dreapta)
