function y=fun(x)
r1=find(abs(x)<eps);
r2=find(abs(x)>=eps);
y(r1)=ones(size(x(r1)));
y(r2)=sin(1./x(r2)).*x(r2);
