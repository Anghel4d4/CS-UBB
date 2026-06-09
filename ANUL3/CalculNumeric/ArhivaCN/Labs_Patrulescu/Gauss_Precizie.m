function Gauss_Precizie
    f = @(x) sin(pi*(x+1)/2);
    precizie = 10^(-3)
    n=2;
    [g_nodes,g_coeff]=Gauss_Ceb1(n);
    I=vquad(g_nodes,g_coeff,f);
    I_vechi=0;
    I_nou=I;
    while abs(I_nou-I_vechi)>precizie
        n=n+1;
        [g_nodes,g_coeff]=Gauss_Ceb1(n);
        I=vquad(g_nodes,g_coeff,f);
        I_vechi=I_nou;
        I_nou=I;
    end
    
    n
    I_nou
    