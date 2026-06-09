function A=bilocalmat(p,q,r,a,b,N)
%BILOCALMAT - matrice pt. problema bilocala
%y''(x)-p(x)y'(x)-q(x)y(x)=r(x), x in [a,b]
%y(a)=alfa, y(b)=beta
%apel y=bilocal(p,q,r,a,b,alfa,beta,N)
%p,q,r - functii
%[a,b] - intervalul
%N - nr. de puncte

h=(b-a)/(N+1); x=a+[1:N]'*h;
vp=p(x); vr=r(x); vq=q(x);
av=1+h^2/2*vq;
bv=1/2*(1+h/2*vp);
cv=1/2*(1-h/2*vp);
B=[[-bv(2:end);0],av,[0;-cv(1:end-1)]];
A=spdiags(B,[-1:1],N,N);
