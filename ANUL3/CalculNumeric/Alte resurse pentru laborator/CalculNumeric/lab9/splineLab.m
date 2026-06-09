function sp = splineLab(X,f,x)

size = length(X);
dx = zeros(size-1);
df = zeros(size);
d1 = zeros(size-1,1);
d0 = zeros(size,1);
dinf = zeros(size-1,1);

dinf(size-1) = 1;
d1(1)=1;
dinf(1) =1;
for i = 1:size-1
   dx(i) = X(i+1) - X(i);
   df(i) = f(i+1) - f(i);
   
   %prima diagonala (superioara)
   if i<= size-1
       if(i>1)
         d1(i) = dx(i);
       end
   end   %ultima diagonala (inferioara)

   
   if i<= size-1
       if i>2
        dinf(i-1) = dx(1);
       end
   end
   
end


%matricea sistemului

%elementele de pe diagonala superioara d1

%elementele de pe diagonala principala d0

d0(size) = 2;
d0(1)=2;

for i = 2:size-1
   d0(i) = 2*(dx(i-1) + dx(i));  
end

%elementele de pe diagonala inferioasa dinf

m1 = diag(d1,1);
m2 = diag(d0,0);
m3 = diag(dinf,-1);

M = m1+m2+m3;



b=zeros(size);
c0=zeros(size);
c1=zeros(size);
c2=zeros(size);
c3=zeros(size);
for i= 2:size-1
    b(i)=3*(dx(i)*df(i-1)/dx(i-1)*df(i)/dx(i));
end

m=M\b;

for i= 1:size-1
    c0(i) = f(i);
    c1(i) = m(i);
    c3(i) = (m(i+1) + m(i) - 2*(df(i)/dx(i)))*1/( dx(i)^2);
    c2(i) = (df(i)/dx(i) - m(i)) * (1/dx(i)) - c3(i)* dx(i);
end

for i= 2:size-1
    b(i)=3*(dx(i)*df(i-1)/dx(i-1) + dx(i-1) * df(i)/dx(i));
end

c0 = c0';

i = -1;
j=0;

%valoarea pentru care se calculeaza sp  i pentru care x dat ca param e
%intre X(i) si X(i+1);
while i == -1
    j=j+1;
    if X(j)<=x && X(j+1)>=x
        i=j;
    end
end

sp = c0(i) + c1(i)*(x-X(i)) + c2(i) *(x-X(i))^2 + c3(i) * (x-X(i))^3;

