function [y]=Bernstein_ni(t,n,i)
y=factorial(n)/(factorial(n-i+1)*factorial(i-1))*(t.^(i-1)).*((1-t).^(n-i+1));