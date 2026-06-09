function[t1,t3,t5]=sinAprox(x)
%http://www.wolframalpha.com/....series sin(x)
t1=x
t3=t1-x.^3/6;%. aplica puterea pe tot vectorul
t5=t3+x.^5/120;