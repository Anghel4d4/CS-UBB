function x = rezolvaSOR(A,b, w, eroare)
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
%D=A+L+U
M = D/w - L;
Minv = inv(M); %mai eficient Minv = diag(1./diag(A));
T = Minv * ((1-w)*D + w *U);
c = w * Minv *b;
iteratii = 0;
x1 = b;
x2 = T*x1 + c;
while norm(x2-x1)>(1-norm(T))/norm(T)*eroare
    x1 = x2;
    x2 = T*x1 + c;
    iteratii = iteratii+1;
    if (iteratii > 100)
        error('Nu converge');
    end
end 
x = x1;
end