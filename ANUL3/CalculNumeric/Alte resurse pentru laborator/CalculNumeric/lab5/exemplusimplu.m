 A=[2 3; 4 5;]
 b=[5;9]
 M=diag(diag(A)) -> Jacoby
 M=tril(A) -> gaussSeidal
 N=M-A
 T=M\N
 c=M\b
 xo=zeros(2,1)
 x=T*xo+c
 norm(x-xo)
 xo=x
 x=T*xo+c   -> imbunatatire : x=M\(N*x0+b)
 norm(x-xo)
 xo=x
 x=T*xo+c
 norm(x-xo) -> tot creste, diverge
 
 norme utile pt criteriu de oprire:
  norm(A,inf)
  norm(A)