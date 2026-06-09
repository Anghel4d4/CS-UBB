function desen(X, f)

Z= 0:0.01:3;
Y=zeros(1,length(Z));
for i=1: length(Z)
    Y(i) = splineLab(X,f,Z(i));
end

plot(Z,Y);
end