function plotCubica(P1,P2,D1,D2)
%reprezinta graficul unei cubice parametrice care trece prin punctele P1 si
%P2 si este tangenta la vectorii D1 si D2

cx = coefCubica(P1(1), P2(1), -D1(1), D2(1));
cy = coefCubica(P1(2), P2(2), -D1(2), D2(2));

t = linspace(0,1,200);
x = polyval(cx, t);
y = polyval(cy, t);
plot(x, y, '-b', [P1(1), P1(1) + D1(1)], [P1(2), P1(2) + D1(2)], '-r', [P2(1), P2(1) + D2(1)], [P2(2), P2(2) + D2(2)], '-r')
end

function c = coefCubica(x0, x1, dx0, dx1)
%calculeaza coeficientii polinomului de gradul 3 
%care satisface conditiile :
%P(0)=x0, P(1)=x1, P'(0)=dx0, P'(1)=dx1

A= zeros(4); b=zeros(4,1);

%P(0)=x0
A(1,:)=[0 0 0 1];
b(1) = x0;

%P(1)=x1
A(2,:)=[1 1 1 1];
b(2) = x1;

%P'(0)=dx0
A(3,:)=[0 0 1 0];
b(3) = dx0;

%P'(1)=dx1
A(4,:)=[3 2 1 0];
b(4) = dx1;

c = A\b;

end