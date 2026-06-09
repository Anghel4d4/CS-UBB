clc
A=round(normrnd(10, 5, 10, 7));% 10 ecuatii, 7 necunoscute
b = ones(10, 1);
x=A\b
x3 = rezolvaCholesky(A,b)
x4 = rezolvaQR(A,b)