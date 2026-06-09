%Problema 4.58. Evaluat¸i
%	1
%	∫ sinx/√ x dx  utilizand o cuadratura adaptiva
%	0

%(a) rezolvand problema as¸a cum este enunt¸at ˆ a;˘
%(b) utilizand o tehnic ˆ a de dezvoltare ˘ ˆın serie;
%(c) utilizand o schimbare de variabil ˆ a.˘
%Comparat¸i rezultatele.


format long
%(a)
Iad=adaptquad(@func,0,1,1e-5,@Simpson)%rezolvand asa cum este

%(b)
[g_nodes,g_coeff]=Gauss_Ceb1(50);
Iser=vquad(g_nodes,g_coeff,@fserie); %prin dezvoltare cu polinomele ortogonale cebisev
Iser=real(Iser)


%(c)
Ischimb=adaptquad(@fschimb,0,1,1e-5,@Simpson) %prin schimbare de variabila

g=@(x)sin(x)./sqrt(x);
Iquad=quad(g,0,1) %prin functia quad din Matlab