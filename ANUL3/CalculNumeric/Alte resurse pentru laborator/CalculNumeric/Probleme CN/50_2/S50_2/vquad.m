function I=vquad(g_nodes,g_coeff,f)
%claculeaza valoarea aproximativa
I=g_coeff*feval(f, g_nodes);