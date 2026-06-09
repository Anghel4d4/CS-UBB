function sp = splineLab(X,f)

size = length(X);
dx = zeros(size);
df = zeros(size);
d1 = zeros(size);
d0 = zeros(size);
dinf = zeros(size);

dinf(size) = 1;

for i = 1:size-1
   dx(i) = X(i+1) - X(i);
   df(i) = f(i+1) - f(i);
   
   %prima diagonala (superioara)
   if i<= size-2
       d1(i) = dx(i);
   end
   
   %ultima diagonala (inferioara)
   if i<= size-2
     dinf(i) = dx(i-1);
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

m1 = diag(d0,1);
m2 = diag(d1,0);
m3 = diag(d2,-1);

sp = m1+m2+m3;
end