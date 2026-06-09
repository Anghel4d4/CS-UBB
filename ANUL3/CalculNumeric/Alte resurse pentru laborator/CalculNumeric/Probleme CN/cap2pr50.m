%inversa unei matrici tridiagonale
n=10;
A=diag(ones(n-1,1),-1)-2*diag(ones(n,1)) +diag(ones(n-1,1),1);
x=inversTridiagonalMatrix(A);
for i=1:n
    for j=i:n
        %if or(x(i,j)~=x(j,i),(x(j,i)~=(-i)*(n+1-j)/(n+1)))
            fprintf('x(i,j)=%f,  x(j,i)=%f,  (-i)*(n+1-j)/(n+1)=%f \n',x(i,j),x(j,i),(-i)*(n+1-j)/(n+1));
        %end
    end
end

