function [x,y]=EcDreptei(X,Y,t)

x=X(1)+t*(X(2)-X(1));
y=Y(1)+t*(Y(2)-Y(1));