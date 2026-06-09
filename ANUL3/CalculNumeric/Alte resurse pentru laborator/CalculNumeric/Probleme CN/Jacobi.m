function [x, ni]=Jacobi(A, b, x0, err, nitmax)
    %parametrii
    %A - matrice
    %b - vector
    %x0 - vector de start
    %err - eroarea (default 1e-4)
    %nitmax - numarul maxim de iteratii (default 100)
    %x - solutia
    %ni - numarul actual de iteratii
    if nargin < 5, nitmax=100; end
    if nargin < 4, err=1e-4; end
    if nargin <3, x0=zeros(size(b)); end
    [m,n] = size(A);
    if (m~=n) | (n~=length(b))
        error('dimensiune gresita')
    end
    M = diag(diag(A));
    N = M-A;
    T = inv(M)*N;
    c = inv(M)*b;
    alfa = norm(T,inf);
    x = x0(:);
    for i = 1:nitmax
        x0 = x;
        x = T*x0+c;
        %conditia de oprire: norm(x-x0,inf)<(1-alfa)/alfa*err
        if norm(x-x0,inf)<(1-alfa)/alfa*err
            ni = i;
            return
        end
    end
    error('s-a depasit numarul de iteratii')