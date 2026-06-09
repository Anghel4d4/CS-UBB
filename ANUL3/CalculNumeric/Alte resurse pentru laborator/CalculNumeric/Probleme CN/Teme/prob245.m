clc
n = 100;
e = -ones(n,1);
f = ones(n,1);
A = spdiags([e 2*f e], -1:1, n, n);
b = (1/(n+1)^2)*ones(n,1);
x0 = A\b;

% punctul a
x1 = rezolvaGaussSeidel(A,b,1e-10);
x2 = rezolvaJacobi(A,b,1e-10);
disp(x1);
disp(x2);


% 219 iteratii n=10, e=1e-6
% 31015 iteratii n=100, e=1e-8
% 31015 iteratii n=100, e=1e-10
% Durata de executie creste de la 1-2 secunde pana la aprox 10 de
% secunde in functie de n si eroare si pentru n=100 indiferent de eroare,
% numarul de iteratii ramane neschimbat

%punctul b
for i=1:n
    t(i)=i/(n+1);
    ee(i)=x1(i)-t(i)*(1-t(i))/2;
    % vectorul de erori
    % disp(ee(i));

end
no = norm(ee(i),2);
% norma lui ee
disp(no);
% pentru n=10, e=1e-6 norma este 3.8700e-10
% pentru n=100, e=1e-10 norma este 4.3455e-16
