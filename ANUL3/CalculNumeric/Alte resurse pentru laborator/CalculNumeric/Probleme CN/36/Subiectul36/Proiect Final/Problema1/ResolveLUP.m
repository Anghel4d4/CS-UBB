function x=ResolveLUP(L,U,P,b)
y=substdir(L,P*b);
x=substinv(U,y);