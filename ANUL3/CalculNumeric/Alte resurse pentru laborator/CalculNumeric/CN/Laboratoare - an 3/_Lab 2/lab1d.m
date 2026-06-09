function A=lab1d(a,h,m) %a-matrix, h-step, m-order
x = a:h:(a + m*h);
A = zeros(m+1, m+1);
A(:,1) = sqrt(x.^2+x);
for j=2:m+1
    for i=1:m-j+2
        A(i,j) = A(i+1,j-1)-A(i,j-1);
    end
end
