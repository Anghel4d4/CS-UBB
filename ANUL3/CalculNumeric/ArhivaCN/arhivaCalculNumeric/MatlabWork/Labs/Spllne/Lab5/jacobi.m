function [x,nrIteratii]=jacobi(x0, A, b, er, Nmax)
    
%    Jacobi
%     M=diag(diag(A)); 
%    Gauss-Siedel
%     M = tril(A);

%   S.O.R
    w=1.1;
    M = 1/w * diag(diag(A)) + tril(A,-1); % w intre 0 si 2
    N=M-A;
    c=M\b;
    T=M\N;
    nrIteratii=0;
    
%     x(1) = x0;
%     x(2) = T*x(1)+c;
%     k=2;
%     
%     while norm(T)/(1-norm(T)) * norm(x(k)-x(k-1)) >= er && nrIteratii<=Nmax
%         k=k+1;
%         x(k) =  T*x(k-1)+c;
%         nrIteratii = nrIteratii+1;
%     end


    x = T*x0+c;
   
    
    while norm(T)/(1-norm(T)) * norm(x-x0) >= er && nrIteratii<=Nmax
        x0=x;
        x =  T*x0+c;
        nrIteratii = nrIteratii+1;
    end

    
