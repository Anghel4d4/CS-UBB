function yp=pend(t,y,g,L)
%PEND - pendul simplu
%g - acceleratia gravitationala, L - lungimea
yp=[y(2); -g/L*sin(y(1))];