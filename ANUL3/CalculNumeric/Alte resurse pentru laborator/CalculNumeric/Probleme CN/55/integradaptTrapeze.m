function int= integradaptTrapeze(f,a,b,n,tol)

int1=integrTrapeze(f,a,b,n);
int2=integrTrapeze(f,a,b,2*n);
if(abs(int1-int2)<tol)
    int=int2;
else
   % int
    int=integradaptTrapeze(f,a,(a+b)/2,2*n,tol)+integradaptTrapeze(f,(a+b)/2,b,n,tol);
end;