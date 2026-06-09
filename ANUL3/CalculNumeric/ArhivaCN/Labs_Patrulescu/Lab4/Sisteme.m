function Sisteme
    clear all
    clc
    U=[1,2,-1,-3;0,1,-1,-2;0,0,1,-4;0,0,0,1]
    L=[1,0,0,0;2,1,0,0;-1,-1,1,0;-3,-2,-4,1]
    b=[1;0;-2;1]
    
    tic 
    xu1=U\b
    toc
    tic
    xu2=TriU(U,b)
    toc
    tic
    xl1=L\b
    toc
    tic
    xl2=TriL(L,b)
    toc