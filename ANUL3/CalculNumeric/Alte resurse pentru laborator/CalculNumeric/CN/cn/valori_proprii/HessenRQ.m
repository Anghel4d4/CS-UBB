function HH=HessenRQ(H)
%HESSENRQ - calculeaza transformarea RQ a unei matrice Hessenberg
%utilizand rotatii Givens
%intrare H -matrice Hesenberg 
%iesire HH - transformarea RQ a lui H

[m,n]=size(H);
Q=eye(m,n);

for k=2:n
    a=H(k-1:k,k-1);
    an=sqrt(a'*a);               %norma euclidiana
    c=sign(a(2))*abs(a(1))/an;   %sinus
    s=sign(a(1))*abs(a(2))/an;   %cosinus
    Jm=eye(n);
    Jm(k-1,k-1)=c; Jm(k,k)=c;
    Jm(k-1,k)=s; Jm(k,k-1)=-s;
    H=Jm*H;
    Q=Q*Jm';
end
HH=H*Q;
    