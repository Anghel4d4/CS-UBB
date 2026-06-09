function [x,y]=bilocal(p,q,r,a,b,alfa,beta,N)
%BILOCAL - problema bilocala
%y''(x)-p(x)y'(x)-q(x)y(x)=r(x), x in [a,b]
%y(a)=alfa, y(b)=beta
%apel y=bilocal(p,q,r,a,b,alfa,beta,N)
%p,q,r - functii
%[a,b] - intervalul
%alfa,bet - valori in capete
%N - nr. de puncte

h=(b-a)/(N+1); x=a+[1:N]'*h;
vp=p(x); vr=r(x); vq=q(x);
av=1+h^2/2*vq;
bv=1/2*(1+h/2*vp);
cv=1/2*(1-h/2*vp);
B=[[-bv(2:end);0],av,[0;-cv(1:end-1)]];
A=spdiags(B,[-1:1],N,N);
bb=-h^2/2*vr; 
bb(1)=bb(1)+(1/2+h/4*vp(1))*alfa;
bb(N)=bb(N)+(1/2-h/4*vp(N))*beta;
y=A\bb;
x=[a;x;b];
y=[alfa;y;beta];