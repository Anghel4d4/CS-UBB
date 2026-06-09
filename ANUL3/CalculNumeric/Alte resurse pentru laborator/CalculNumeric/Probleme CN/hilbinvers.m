function X=hilbinvers(n)
X=zeros(n);
for i=1:n
    for j=1:n
        %X(i,j)=(-1)^(i+j)*(i+j-1)*nchoosek(n+i-1,n-j)*nchoosek(n+j-1,n-i)*...
         %   nchoosek(i+j-2,i-1)^2;
        X(i,j)=(-1)^(i+j)/(i+j-1)*factorial(n+i-1)*factorial(n+j-1)/...
            (factorial(n-j)*factorial(n-i)*factorial(j-1)^2*factorial(i-1)^2);
    end
end

