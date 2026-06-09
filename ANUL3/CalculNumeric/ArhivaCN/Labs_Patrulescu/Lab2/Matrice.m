function Matrice
    n = 100;
    A = diag(2*ones(1,n)) + diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);
    B = sparse(A);
    whos
    who
    tic 
    norm(A,'fro')
    timp1 = toc;
    timp1
    
    tic 
    s=0;
    for i=1:n
        for j=1:n
            s=s+A(i,j).^2;
        end
    end
    s=sqrt(s)
    timp2 = toc;
    [timp1,timp2]
    
    tic
    s=0;
    for i=1:n
        s=s+sum(A(i,:).^2)
    end;
    s=sqrt(s);
    timp3 = toc;
    [timp1,timp2,timp3]
    
    tic
    s = sum(sum(A.^2));
    s= sqrt(s);
    
    timp4=toc;
    
    [timp1,timp2,timp3,timp4]
    
    tic
    s = sum(sum(B.^2));
    s=sqrt(s);
    timp5 = toc;
  
    [timp1,timp2,timp3,timp4,timp5]