format long
k=1:11;
t=(k-1)/10;
y=erf(t);
%(a)
tt=0.05:0.1:0.95;
err=zeros(1,10);
for i=1:10
    p=polyfit(t,y,i);
    yy=polyval(p,tt);
    err(i)=max(erf(tt)-yy);
end
 fprintf('   Grad polinomului    erroare maxima\n')
disp([[1:10]', err'])
%Se observa ca eroarea maxima scade cu cresterea gradului polinomului

%(b)
t=t';
y=y'; 
for n=1:10
 A=t;
 for j=2:n 
 A=[A t.^(2*j-1)];
 end
 p=A\y;
 p=p(end:-1:1);
 z=zeros(1,2*n);
 z(1:2:2*n)=p;
 yy=polyval(z,tt);
 err(i)=max(erf(tt)-yy);
 end

 fprintf('   Grad polinomului    erroare maxima\n')
disp([2*[1:10]'-1, err'])
%se observe ca erorile de aproximare scad mai repede (decat in cazul
%precedent) cu cresterea lu n

%(c)
A=[ones(size(t)) exp(-t.^2) exp(-t.^2)./(1+t) exp(-t.^2)./(1+t).^2 exp(-t.^2)./(1+t).^3];
c=A\y;
z=1./(1+tt);
yy=c(1)+exp(-tt.^2).*(c(2)+c(3).*z+c(4).*z.^2+c(5).*z.^3);
err=max(yy-erf(tt))
%Eroare este de ord 2.3e-5 ,in cazul precedent pt un polinom de grad 9 am
%obtinut o eroare asemanatore, deci modelul aproximeaza foarte bine functia
%erf(x)

