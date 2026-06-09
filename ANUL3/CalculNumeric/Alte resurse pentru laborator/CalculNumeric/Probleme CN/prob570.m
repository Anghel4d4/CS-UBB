%legatura cu iteratia Newton este ca Derivata functiei in x_k a fost
%aproximata cu f'(x_k)=(f(x_k+h)-f(x_k))/h unde pt h am ales chiar f(x_k)

[z,ni]=Iter(@f,1)


[z,ni]=Iter(@f,10)


[z,ni]=Iter(@f,-10)

