function result=grafic(x,y)

%nEcuatii=10;
A=zeros(10,5);
A(:,1)=x.^2;
A(:,2)=x.*y;
A(:,3)=y.^2;
A(:,4)=x;
A(:,5)=y;

b=-ones(10,1);

coef=A\b;

% [a b c d e] = coef;
a=coef(1);
b=coef(2);
c=coef(3);
d=coef(4);
e=coef(5);

plot(x,y,'o');
hold on
contour(A*coef-b)