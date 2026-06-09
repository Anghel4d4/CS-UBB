x=0:0.1:0.5;
n=length(x);
Int=zeros(1,n-1);
%in continuare aproximam integrala pe subintervale
f=@(t)exp(t.^2);
for i=1:n-1
    Int(i)=Romberg(f,x(i),x(i+1));
end

I=cumsum(Int);
I=[0 I];
ex=exp(-x.^2);
y=ex.*I;
fprintf('    x         y(x)\n' )
disp([x' y'])



