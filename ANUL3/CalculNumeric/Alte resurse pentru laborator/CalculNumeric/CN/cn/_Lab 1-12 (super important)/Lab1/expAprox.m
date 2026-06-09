function[t1,t2,t3,t4,t5]=expAprox(x)
t1=1+x%polinomul de gradul I
t2=t1+x.^2/2
t3=t2+x.^3/6
t4=t3+x.^4/24
t5=t4+x.^5/120