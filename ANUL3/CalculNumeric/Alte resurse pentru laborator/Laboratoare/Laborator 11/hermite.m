function a=Hermite(X, Y, dy)

size = 2*length(X);
P = zeros(size);
i=1;
while i < size
    P(i,1) = Y(round(i/2));
    if i+1 <= size
        P(i+1,1) = Y(round(i/2));
    end
    i=i+2;
end

for i= 1: size-1
    if mod(i,2) == 0
       P(i,2) = (Y(round(i/2)+1)-Y(round(i/2)))/ (X(round(i/2)+1)-X(round(i/2)));
    else
        P(i,2) = dy(round(i/2));
    end
end

for i=1:size-1
   for j=3: (size - i +1)
       P(i,j) = (P(i+1,j-1) - P(i,j-1))/ (P(i+j-1,1) - P(i,1));
   end
end

a=P;
end