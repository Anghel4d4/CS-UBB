function y=approxChebyshev(f,x,n)
%APPROXCHEBYSHEV - aproximare continua mcmmp Cebisev #1
%apel Y=APPROXCHEBYSHEV(F,X)
%F - functia
%X - punctele
%N - gradul
%Y - valorile aproximantei

c=coeffChebyshev(f,n);
y=evalChebyshev(c,x);