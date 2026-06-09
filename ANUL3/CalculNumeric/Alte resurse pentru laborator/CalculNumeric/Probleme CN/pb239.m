clc
for n=3:11
    n
    A = diag(3*ones(n,1),0)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1) + fliplr(diag([1/2*ones(floor((n-1)/2),1);zeros(2 - mod(n,2),1);1/2*ones(floor((n-1)/2),1)],0))
    b = [2.5; 1.5 * ones(floor((n-3)/2),1); ones(2 - mod(n,2),1); 1.5*ones(floor((n-3)/2),1); 2.5]
    x = rezolvaGaussSeidel(A,b,1e-5)
end